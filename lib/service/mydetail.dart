import 'package:flutter/material.dart';

class Mydetail extends StatefulWidget {
  const Mydetail({Key? key}) : super(key: key);

  @override
  _MydetailState createState() => _MydetailState();
}

class _MydetailState extends State<Mydetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แสดงข้อมูล"),
        actions: [
          FlatButton(
            onPressed: () {},
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
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.supervised_user_circle),
                        hintText: 'ชื่อ',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.supervised_user_circle_sharp),
                        hintText: 'ชื่อเล่น',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'เบอร์โทร',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.info_outline),
                        hintText: 'Id Line',
                      ),
                    ),
                  ],
                ),
              ),
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
