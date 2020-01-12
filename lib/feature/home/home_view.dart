import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piczzie/feature/login/login_view.dart';
import 'package:piczzie/feature/profile/profile_screen.dart';
import 'package:piczzie/ressources/color.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  String title;

  @override
  _homeViewState createState() => _homeViewState();
}

class _homeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final _homeScreen = GlobalKey<NavigatorState>();
  final _searchScreen = GlobalKey<NavigatorState>();
  final _galleryScreen = GlobalKey<NavigatorState>();
  final _notificationScreen = GlobalKey<NavigatorState>();
  final _profileScreen = GlobalKey<NavigatorState>();

  bool initHomeScreen =false;
  bool initSearchScreen = false;
  bool initGalleryScreen = false;
  bool initNotificationScreen = false;
  bool initProfileScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          Navigator(
            key: _homeScreen,
            onGenerateRoute: (route) =>
                MaterialPageRoute(
                    settings: route, builder: (context) => LoginView()),
          ),
          Navigator(
            key: _searchScreen,
            onGenerateRoute: (route) =>
                MaterialPageRoute(
                    settings: route, builder: (context) => LoginView()),
          ),
          Navigator(
            key: _galleryScreen,
            onGenerateRoute: (route) =>
                MaterialPageRoute(
                    settings: route, builder: (context) => LoginView()),
          ),
          Navigator(
            key: _notificationScreen,
            onGenerateRoute: (route) =>
                MaterialPageRoute(
                    settings: route, builder: (context) => LoginView()),
          ),
          Navigator(
            key: _profileScreen,
            onGenerateRoute: (route) =>
                MaterialPageRoute(
                    settings: route,
                    builder: (context) {
                      if (_selectedIndex == 4 || initProfileScreen) {
                        initProfileScreen = true;
                        return ProfileScreen();
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          iconSize: 28,
          elevation: 10,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("")),
            BottomNavigationBarItem(icon: Icon(Icons.add_box), title: Text("")),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), title: Text("")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text(""))
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: CustomColors.greenCustom,
          onTap: _onTap),
    );
  }

  void _onTap(int val) {
    if (_selectedIndex == val) {
      switch (val) {
        case 0:
          _homeScreen.currentState.popUntil((route) => route.isFirst);
          break;
        case 1:
          _searchScreen.currentState.popUntil((route) => route.isFirst);
          break;
        case 2:
          _galleryScreen.currentState.popUntil((route) => route.isFirst);
          break;
        case 3:
          _notificationScreen.currentState.popUntil((route) => route.isFirst);
          break;
        case 4:
          _profileScreen.currentState.popUntil((route) => route.isFirst);
          break;
        default:
      }
    } else {
      if (mounted) {
        setState(() {
          _selectedIndex = val;
        });
      }
    }
  }
}
