// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gift _$GiftFromJson(Map<String, dynamic> json) {
  return Gift(
    id: json['_id'] as String,
    description: json['description'] as String,
    price: (json['price'] as num)?.toDouble(),
    place: json['place'] as String,
    website: json['website'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    image: json['image'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    userReserved: json['user_reserved'] == null
        ? null
        : User.fromJson(json['user_reserved'] as Map<String, dynamic>),
    userRequest: json['user_request'] == null
        ? null
        : User.fromJson(json['user_request'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GiftToJson(Gift instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('description', instance.description);
  writeNotNull('price', instance.price);
  writeNotNull('place', instance.place);
  writeNotNull('website', instance.website);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('image', instance.image);
  writeNotNull('user', instance.user);
  writeNotNull('user_reserved', instance.userReserved);
  writeNotNull('user_request', instance.userRequest);
  return val;
}
