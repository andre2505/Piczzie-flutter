import 'package:built_value/built_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @nullable
  @JsonKey(name: '_id', includeIfNull: false)
  final String id;

  @nullable
  @JsonKey(name: 'firstname', includeIfNull: false)
  String firstname;

  @nullable
  @JsonKey(name: 'lastname', includeIfNull: false)
  String lastname;

  @nullable
  @JsonKey(name: 'gender', includeIfNull: false)
  int gender;

  @nullable
  @JsonKey(name: 'email', includeIfNull: false)
  final String email;

  @nullable
  @JsonKey(name: 'password', includeIfNull: false)
  final String password;

  @nullable
  @JsonKey(name: 'birthday', includeIfNull: false)
  DateTime birthday;

  @nullable
  @JsonKey(name: 'photo', includeIfNull: false)
  String photo;

  @nullable
  @JsonKey(name: 'friends', includeIfNull: false)
  List<User> friends;

  @nullable
  @JsonKey(name: 'token', includeIfNull: false)
  final String token;

  @nullable
  @JsonKey(name: 'refresh_token', includeIfNull: false)
  final String refreshToken;

  @override
  User({this.id, this.email, this.password, this.token, this.refreshToken});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
