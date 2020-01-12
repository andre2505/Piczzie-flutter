import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piczzie/feature/login/login_view.dart';
import 'package:piczzie/feature/profile/components/profile_gift/profile_gift_screen.dart';
import 'package:piczzie/feature/profile/components/profile_informations.dart';
import 'package:piczzie/feature/profile/profile_bloc.dart';
import 'package:piczzie/feature/profile/profile_state.dart';
import 'package:piczzie/ressources/color.dart';
import 'package:piczzie/ressources/icons/picons.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key, this.title}) : super(key: key);

  String title;

  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  int _index;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _index = 0;
    _tabController.addListener(_changeIndex);
  }

  @override
  bool get wantKeepAlive => true;


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: CustomColors.greenCustom,
        brightness: Brightness.dark,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginView()));
            },
          )
        ],
      ),
      body: BlocProvider(
          builder: (context) => ProfileBloc(),
          child:
              BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
            return Container(
                child: Column(children: [
              ProfileInformations(),
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Colors.grey[300],
                              width: 1,
                              style: BorderStyle.solid),
                          bottom: BorderSide(
                              color: Colors.grey[300],
                              width: 1,
                              style: BorderStyle.solid))),
                  child: TabBar(
                    indicatorWeight: 5,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.pink,
                    tabs: <Widget>[
                      Tab(
                          icon: Icon(
                              _index == 0 ? Picons.plain_gift : Picons.gift)),
                      Tab(
                        icon: Icon(_index == 1
                            ? Picons.favorite_heart_button
                            : Picons.heart),
                      ),
                    ],
                  )),
              Expanded(
                  child: TabBarView(
                controller: _tabController,
                children: <Widget>[ProfileGift(), Text("slkmjkljlkmsf")],
              ))
            ]));
          })),
    );
  }

  _changeIndex() {
    setState(() {
      _index = _tabController.index;
    });
  }
}
