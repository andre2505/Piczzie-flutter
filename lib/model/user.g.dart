// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    token: json['token'] as String,
    refreshToken: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('token', instance.token);
  writeNotNull('refresh_token', instance.refreshToken);
  return val;
}
