import 'package:flutter/material.dart';

class ProfileRelationshipScreen extends StatelessWidget {
  ProfileRelationshipScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: FlatButton(
        child: Text("Amis", style: TextStyle(color: Colors.blueGrey)),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {},
      )),
      Container(
          height: 50,
          width: 1,
          child: VerticalDivider(color: Colors.grey[700])),
      Expanded(
          child: FlatButton(
        child: Text("Enfant", style: TextStyle(color: Colors.blueGrey)),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {},
      ))
    ]);
  }
}
