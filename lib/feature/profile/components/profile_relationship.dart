import 'package:flutter/material.dart';
import 'package:piczzie/l10n/localization/localization.dart';
import 'package:piczzie/model/child.dart';
import 'package:piczzie/model/user.dart';

class ProfileRelationshipScreen extends StatelessWidget {
  ProfileRelationshipScreen({Key key, this.user, this.childs})
      : super(key: key);

  User user;
  List<Child> childs;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: FlatButton(
        child: Text(
        (user.friends.length > 1) ? AppLocalizations.of(context).friends(user.friends.length.toString()) : AppLocalizations.of(context).friend(user.friends.length.toString()),
            style: TextStyle(color: Colors.blueGrey)),
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
        child: Text((user.friends.length > 1) ? AppLocalizations.of(context).children(user.friends.length.toString()) : AppLocalizations.of(context).child(user.friends.length.toString()),
            style: TextStyle(color: Colors.blueGrey)),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {},
      ))
    ]);
  }
}
