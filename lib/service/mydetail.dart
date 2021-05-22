import 'dart:convert';

import 'package:flutter/material.dart';

import '../config.dart';

class Mydetail extends StatefulWidget {
  final String? status;
  final data;

  const Mydetail({Key? key, this.status, this.data}) : super(key: key);

  @override
  _MydetailState createState() => _MydetailState();
}

class _MydetailState extends State<Mydetail> {
  GlobalKey<FormState> _keyform = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _nickname = TextEditingController();
  TextEditingController _tel = TextEditingController();
  TextEditingController _idline = TextEditingController();
  bool autovalidate = false;

  String? checkemty(String? value) {
    if (value == '') {
      return 'กรุณากรอกข้อมูลช่องนี้';
    }
    return null;
  }

  check() {
    if (widget.status == 'add') {
      save();
    } else {
      update();
    }
  }

  Future<void> save() async {
    if (!_keyform.currentState!.validate()) {
      setState(() {
        autovalidate = true;
      });
      //print(_keyform.currentState!.validate());
    } else {
      await Connect()
          .post(
        'add_book',
        jsonEncode(
          {
            "nickname": _nickname.text,
            "name": _name.text,
            "tel": _tel.text,
            "avatar": null,
            "id_line": _idline.text,
          },
        ),
      )
          .then((value) {
        if (value.statusCode == 200) {
          Navigator.pop(context, true);
        }
      });
    }
  }

  Future<void> update() async {
    if (!_keyform.currentState!.validate()) {
      setState(() {
        autovalidate = true;
      });
      //print(_keyform.currentState!.validate());
    } else {
      await Connect()
          .put(
        'update_book/' + widget.data['id'].toString(),
        jsonEncode(
          {
            "nickname": _nickname.text,
            "name": _name.text,
            "tel": _tel.text,
            "avatar": null,
            "id_line": _idline.text,
          },
        ),
      )
          .then((value) {
        if (value.statusCode == 200) {
          Navigator.pop(context, true);
        }
      });
    }
  }

  @override
  void initState() {
    if (widget.status == 'edit') {
      setState(() {
        _name.text = widget.data['name'];
        _tel.text = widget.data['tel'];
        _nickname.text = widget.data['nickname'];
        _idline.text = widget.data['id_line'];
      });
    } else if (widget.status == 'show') {
      setState(() {
        _name.text = widget.data['name'];
        _tel.text = widget.data['tel'];
        _nickname.text = widget.data['nickname'];
        _idline.text = widget.data['id_line'];
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.status == "add"
              ? "เพิ่มข้อมูล"
              : widget.status == 'edit'
                  ? "แก้ไขข้อมูล"
                  : "แสดงข้อมูล",
        ),
        actions: [
          FlatButton(
            onPressed: () => check(),
            child: Text("เสร็จสิ้น"),
            textColor: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 60,
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text("เลือกรูป"),
            ),
            Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: _keyform,
                    autovalidate: autovalidate,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.supervised_user_circle),
                            hintText: 'ชื่อ',
                          ),
                          controller: _name,
                          validator: checkemty,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _nickname,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.supervised_user_circle_sharp),
                            hintText: 'ชื่อเล่น',
                          ),
                          validator: checkemty,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _tel,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'เบอร์โทร',
                          ),
                          validator: checkemty,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _idline,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.info_outline),
                            hintText: 'Id Line',
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.phone),
      ),
    );
  }
}
