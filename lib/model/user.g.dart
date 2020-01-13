// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['_id'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    token: json['token'] as String,
    refreshToken: json['refresh_token'] as String,
  )
    ..firstname = json['firstname'] as String
    ..lastname = json['lastname'] as String
    ..gender = json['gender'] as int
    ..birthday = json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String)
    ..photo = json['photo'] as String
    ..friends = (json['friends'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('firstname', instance.firstname);
  writeNotNull('lastname', instance.lastname);
  writeNotNull('gender', instance.gender);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('birthday', instance.birthday?.toIso8601String());
  writeNotNull('photo', instance.photo);
  writeNotNull('friends', instance.friends);
  writeNotNull('token', instance.token);
  writeNotNull('refresh_token', instance.refreshToken);
  return val;
}
