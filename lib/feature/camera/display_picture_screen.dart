// A widget that displays the picture taken by the user.
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piczzie/feature/main/main_bloc.dart';
import 'package:piczzie/feature/main/main_event.dart';
import 'package:piczzie/l10n/localization/localization.dart';
import 'package:piczzie/model/gift.dart';
import 'package:piczzie/ressources/color.dart';
import 'package:piczzie/ressources/icons/picons.dart';
import 'package:piczzie/service/base_network/navigation_service.dart';
import 'package:piczzie/service/service_locator.dart';

class DisplayPictureScreen extends StatefulWidget {
  DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  _displayPictureScreen createState() => _displayPictureScreen();
}

class _displayPictureScreen extends State<DisplayPictureScreen> {
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _placeController = TextEditingController();
  final _websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SafeArea(
              child: Stack(children: [
                  Container(color: Colors.white),
              SingleChildScrollView(
                primary: false,
                child: Column(
                  children: [
                    Image.file(File(widget.imagePath)),
                    Container(
                      padding: EdgeInsets.all(24),
                      child: Column(children: <Widget>[
                        TextField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Picons.plain_gift,
                              color: Colors.yellowAccent,
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0)),
                            contentPadding:
                            EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 0.0),
                            hintText:
                            AppLocalizations.of(context).description(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _priceController,
                          keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            focusColor: Colors.grey,
                            prefixIcon: Icon(
                              Icons.monetization_on,
                              color: Colors.blueAccent,
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0)),
                            hintText: AppLocalizations.of(context).price(),
                            contentPadding:
                            EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 0.0),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _placeController,
                          decoration: InputDecoration(
                            focusColor: Colors.grey,
                            prefixIcon: Icon(
                              Icons.place,
                              color: Colors.pink,
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0)),
                            hintText: AppLocalizations.of(context).place(),
                            contentPadding:
                            EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 0.0),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _websiteController,
                          keyboardType: TextInputType.url,
                          decoration: InputDecoration(
                            focusColor: Colors.grey,
                            prefixIcon: Icon(
                              Icons.web,
                              color: Colors.deepOrange,
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0)),
                            hintText: AppLocalizations.of(context).website(),
                            contentPadding:
                            EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 0.0),
                          ),
                        ),
                        SizedBox(height: 15),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                width: double.infinity,
                                child: Container(
                                  height: 70,
                                  width: double.maxFinite,
                                  padding: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 10,
                                      bottom: 10),
                                  child: RaisedButton(
                                    child: Text(
                                      AppLocalizations.of(context).addGift(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    elevation: 0,
                                    highlightElevation: 0,
                                    highlightColor: Colors.yellowAccent,
                                    color: CustomColors.greenCustom,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(40.0),
                                    ),
                                    onPressed: () {
                                      final newGift = Gift();
                                      newGift.description =
                                          _descriptionController.text;
                                      newGift.price =
                                          double.parse(_priceController.text);
                                      newGift.place = _placeController.text;
                                      newGift.website = _placeController.text;
                                      BlocProvider.of<MainBloc>(context).add(AddGiftEvent(newGift, widget.imagePath));
                                    },
                                  ),
                                )) //Your widget here,
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              Align(
              alignment: FractionalOffset.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  locator<NavigationService>().pop();
                },
              ),
            ),
            ]))));
  }
}
