import 'package:built_value/built_value.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:piczzie/model/user.dart';

part 'gift.g.dart';

@JsonSerializable()
class Gift {
  @nullable
  @JsonKey(name: '_id', includeIfNull: false)
  final String id;

  @nullable
  @JsonKey(includeIfNull: false)
  final String description;

  @nullable
  @JsonKey(includeIfNull: false)
  final double price;

  @nullable
  @JsonKey(includeIfNull: false)
  final String place;

  @nullable
  @JsonKey(includeIfNull: false)
  final String website;

  @nullable
  @JsonKey(includeIfNull: false)
  final DateTime date;

  @nullable
  @JsonKey(includeIfNull: false)
  final String image;

  @nullable
  @JsonKey(includeIfNull: false)
  final User user;

  @nullable
  @JsonKey(name: 'user_reserved', includeIfNull: false)
  final User userReserved;

  @nullable
  @JsonKey(name: 'user_request', includeIfNull: false)
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


  factory Gift.fromJson(Map<String, dynamic> json) => _$GiftFromJson(json);

  Map<String, dynamic> toJson() => _$GiftToJson(this);
}
