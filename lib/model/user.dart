import 'package:built_value/built_value.dart';

class User {
  @nullable
  String id;

  @nullable
  String email;

  @nullable
  String password;

  @nullable
  String token;

  User({this.id, this.email, this.password, this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {
  'email': email,
  'password': password
};}
