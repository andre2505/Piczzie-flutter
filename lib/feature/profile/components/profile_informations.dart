import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInformations extends StatefulWidget {
  ProfileInformations({Key key}) : super(key: key);

  @override
  _profileInformationsState createState() => _profileInformationsState();
}

class _profileInformationsState extends State<ProfileInformations> {
  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.vertical, children: [
      Container(
          width: double.infinity,
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:20),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "http://localhost:8080/uploads/5c447f1d19c08bbdd4373353/profil/telechargement.png"))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.cake, color: Colors.grey),
                  SizedBox(width: 10),
                  Padding( padding: EdgeInsets.only(top: 5),
                      child: Text("sdfsfsf sfsfdsfs", textAlign: TextAlign.justify)
                  )
                ],
              ),
              Text("sfdsf"),
              RaisedButton(child: Text("ok"),
                onPressed: (){

                },
              )
            ],
          ))
    ]);
  }
}
