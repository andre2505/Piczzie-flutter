import 'package:flutter/material.dart';
import 'package:flutter_bloc/DataLayer/Restaurant.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    Key key,
    @required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(restaurant.name),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}
