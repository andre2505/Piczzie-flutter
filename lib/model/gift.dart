import 'dart:ffi';

import 'package:built_value/built_value.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:piczzie/model/user.dart';

@immutable
class Gift extends Equatable {
  @nullable
  final String id;

  @nullable
  final String description;

  @nullable
  final double price;

  @nullable
  final String place;

  @nullable
  final String website;

  @nullable
  final DateTime date;

  @nullable
  final String image;

  @nullable
  final User user;

  @nullable
  final User userReserved;

  @nullable
  final User userRequest;

  @override
  Gift(
      {this.id,
      this.description,
      this.price,
      this.place,
      this.website,
      this.date,
      this.image,
      this.user,
      this.userReserved,
      this.userRequest});

  factory Gift.fromJson(Map<String, dynamic> json) {
    var _price = json['price'];
    var _date = json['date'];
    return Gift(
        id: json['_id'],
        description: json['description'],
        price: _price != null ? _price.toDouble() : 0.0,
        place: json['place'],
        website: json['website'],
        date: DateTime.parse(_date),
        image: json["image"],
        user: json["user"],
        userReserved: json["user_reserved"],
        userRequest: json["user_request"]);
  }

  //Map<String, dynamic> toJson() => {'email': email, 'password': password};

  @override
  List<Object> get props => [
        this.id,
        this.description,
        this.price,
        this.place,
        this.website,
        this.date,
        this.image,
        this.user,
        this.userReserved,
        this.userRequest
      ];
}
