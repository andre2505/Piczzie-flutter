import 'dart:convert';

import 'package:flutter_bloc/DataLayer/Location.dart';
import 'package:http/http.dart' as http;

Future<List<Location>> fetchLocation() async {
  final response =
  await http.get('https://developers.zomato.com/api/v2.1/locations?query=paris');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return List<Location>.from(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}