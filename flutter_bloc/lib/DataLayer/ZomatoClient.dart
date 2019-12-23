import 'package:flutter_bloc/DataLayer/Location.dart';
import 'package:flutter_bloc/DataLayer/Restaurant.dart';
import 'package:flutter_bloc/api/Location.dart';

class ZomatoClient {
  final _apiKey = '9420c7c498d3fe2776f2ff9467285d7c';

  Future<List<Location>>fetchLocations(query){
    return fetchLocation();
  }

  List<Restaurant> fetchRestaurants(location,query){
    return List<Restaurant>(query);
  }
}