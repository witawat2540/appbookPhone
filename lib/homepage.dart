import 'dart:convert';

import 'package:addbookphone/service/mydetail.dart';
import 'package:addbookphone/service/mylist.dart';
import 'package:addbookphone/service/mywidget.dart';
import 'package:flutter/material.dart';

import 'config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List data = [];
  TextEditingController _keyword = TextEditingController();

  Future<void> getData() async {
    await Connect().get('get_All').then((value) {
      if (value.statusCode == 200) {
        setState(() {
          data = jsonDecode(value.body);
          print(data.length);
        });
      }
    });
  }

  Future<void> delete(int id) async {
    await Connect().delete('delete_book/' + id.toString()).then((value) {
      if (value.statusCode == 200) {
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text("ลบสำเร็จ"),
          ),
        );
        getData();
      }
    });
  }

  Future<void> search() async {
    await Connect().get('Search_book/' + _keyword.text).then((value) {
      if (value.statusCode == 200) {
        setState(() {
          data = jsonDecode(value.body);
          //print(data.length);
        });
      }
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("รายชื่อ"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Mydetail(
                  status: "add",
                ),
              ),
            ).then((value) {
              if (value ?? false) {
                _scaffoldKey.currentState!.showSnackBar(
                  SnackBar(
                    content: Text("บันทึกสำเร็จ"),
                  ),
                );
                getData();
              }
            }),
            icon: Icon(Icons.add),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("witawatd"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                ),
                accountEmail: Text("witawatd81@gmail.com"))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _keyword,
                onChanged: (String? value) {
                  if (value!.length > 2) search();
                  if (value.length < 2) getData();
                },
                decoration: InputDecoration(
                  hintText: "ค้นหา",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Column(
              children: data.map((e) {
                return Column(
                  children: [
                    Mylist(
                      name: e['name'],
                      tel: e['tel'],
                      edit: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Mydetail(
                                status: "edit",
                                data: e,
                              ),
                            )).then((value) {
                          if (value ?? false) {
                            _scaffoldKey.currentState!.showSnackBar(
                              SnackBar(
                                content: Text("แก้ไขสำเร็จ"),
                              ),
                            );
                            getData();
                          }
                        });
                      },
                      delete: () => delete(e['id']),
                      ontab: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Mydetail(
                            status: "show",
                            data: e,
                          ),
                        ),
                      ),
                    ),
                    MyWidget.buildDivider()
                  ],
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
