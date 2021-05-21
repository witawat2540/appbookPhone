import 'package:flutter/material.dart';

class Mylist extends StatelessWidget {
  final String? name, tel, url;
  final ontab;

  const Mylist({
    Key? key,
    this.name,
    this.tel,
    this.url,
    this.ontab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("$name"),
      subtitle: Text("$tel"),
      leading: CircleAvatar(
        backgroundColor: Colors.orange,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 30,
            width: 30,
            child: RaisedButton(
              padding: EdgeInsets.all(2),
              color: Colors.orange,
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            height: 30,
            width: 30,
            child: RaisedButton(
              padding: EdgeInsets.all(2),
              color: Colors.redAccent,
              onPressed: () {},
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      onTap: ontab,
      //onLongPress: () => longontap,
    );
  }
}
