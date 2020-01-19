// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Child _$ChildFromJson(Map<String, dynamic> json) {
  return Child(
    id: json['_id'] as String,
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
    gender: json['gender'] as int,
    birthday: json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String),
    parent: json['parent'] == null
        ? null
        : User.fromJson(json['parent'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChildToJson(Child instance) {
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
  writeNotNull('birthday', instance.birthday?.toIso8601String());
  writeNotNull('parent', instance.parent);
  return val;
}
