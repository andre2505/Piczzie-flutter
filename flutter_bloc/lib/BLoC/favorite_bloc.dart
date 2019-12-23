import 'dart:async';

import 'package:flutter_bloc/BLoC/bloc.dart';
import 'package:flutter_bloc/DataLayer/Restaurant.dart';

class FavoriteBloc implements Bloc {
  var _restaurants = <Restaurant>[];
  List<Restaurant> get favorites => _restaurants;
  // 1
  final _controller = StreamController<List<Restaurant>>.broadcast();
  Stream<List<Restaurant>> get favoritesStream => _controller.stream;

  void toggleRestaurant(Restaurant restaurant) {
    if (_restaurants.contains(restaurant)) {
      _restaurants.remove(restaurant);
    } else {
      _restaurants.add(restaurant);
    }

    _controller.sink.add(_restaurants);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
