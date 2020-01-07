import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piczzie/feature/profile/profile_state.dart';
import 'package:piczzie/model/gift.dart';

import '../profile_bloc.dart';
import '../profile_event.dart';

class ProfileGift extends StatefulWidget {
  ProfileGift({Key key}) : super(key: key);

  @override
  _profileGiftState createState() => _profileGiftState();
}

class _profileGiftState extends State<ProfileGift> {
  List<Gift> gifts = List<Gift>();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        BlocProvider.of<ProfileBloc>(context).add(GetGiftList("5c616ee79a63451852a492b6", gifts.length));
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileBloc>(context).add(GetGiftList("5c616ee79a63451852a492b6", gifts.length));
    if (BlocProvider.of<ProfileBloc>(context).state is SuccessProfileState) {
      gifts.addAll(
          (BlocProvider.of<ProfileBloc>(context).state as SuccessProfileState)
              .gifts);
    }
    return GridView.builder(
        itemCount: gifts.length,
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          print("http://localhost:8080/" + gifts[index].image);
          return Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "http://localhost:8080/" + gifts[index].image))),
          );
        });
  }
}
