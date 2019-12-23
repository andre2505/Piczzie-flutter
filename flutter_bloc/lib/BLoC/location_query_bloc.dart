import 'dart:async';

import 'package:flutter_bloc/BLoC/bloc.dart';
import 'package:flutter_bloc/DataLayer/Location.dart';
import 'package:flutter_bloc/DataLayer/ZomatoClient.dart';

class LocationQueryBloc implements Bloc {
  final _controller = StreamController<List<Location>>();
  final _client = ZomatoClient();
  Stream<List<Location>> get locationStream => _controller.stream;

  void submitQuery(String query) async {
    // 1cc
    final results =  _client.fetchLocations(query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}