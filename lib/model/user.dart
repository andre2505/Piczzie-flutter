import 'package:built_value/built_value.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class User extends Equatable {
  @nullable
  final String id;

  @nullable
  final String email;

  @nullable
  final String password;

  @nullable
  final String token;

  @nullable
  final String refreshToken;

  @override
  User({this.id, this.email, this.password, this.token, this.refreshToken});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
      refreshToken: json['refresh_token']
    );
  }

  Map<String, dynamic> toJson() => {'email': email, 'password': password};

  @override
  List<Object> get props => [id, email, password, token, refreshToken];
}
