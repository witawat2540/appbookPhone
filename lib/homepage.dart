import 'package:addbookphone/service/mydetail.dart';
import 'package:addbookphone/service/mylist.dart';
import 'package:addbookphone/service/mywidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายชื่อ"),
        actions: [
          IconButton(
            onPressed: () {},
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
                decoration: InputDecoration(
                  hintText: "ค้นหา",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Mylist(
              name: "name",
              tel: "0856525845",
              ontab: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Mydetail(),
                ),
              ),
            ),
            MyWidget.buildDivider()
          ],
        ),
      ),
    );
  }
}
