import 'package:flutter/material.dart';

class Dialogs {
  static showProgressDialog(BuildContext context, String s) {
    try {
      return Container(
          child: Dialog(
              child: Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: [CircularProgressIndicator(),
                       SizedBox(width: 20),
                       Text(s)])
                    ],
                  ))));
    } catch (e) {
      print(e.toString());
    }
  }
}
