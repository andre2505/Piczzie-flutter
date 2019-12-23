import 'package:flutter/material.dart';
import 'package:flutter_bloc/BLoC/bloc_provider.dart';
import 'package:flutter_bloc/BLoC/favorite_bloc.dart';
import 'package:flutter_bloc/BLoC/location_bloc.dart';
import 'package:flutter_bloc/Ui/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc>(
      bloc: LocationBloc(),
      child: BlocProvider<FavoriteBloc>(
        bloc: FavoriteBloc(),
        child: MaterialApp(
          title: 'Restaurant Finder',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: MainScreen(),
        ),
      ),
    );
  }
}

