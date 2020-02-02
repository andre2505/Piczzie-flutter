import 'package:built_value/built_value.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:piczzie/model/user.dart';

part 'gift.g.dart';

@JsonSerializable()
class Gift {
  @nullable
  @JsonKey(name: '_id', includeIfNull: false)
  String id;

  @nullable
  @JsonKey(includeIfNull: false)
  String description;

  @nullable
  @JsonKey(includeIfNull: false)
  double price;

  @nullable
  @JsonKey(includeIfNull: false)
  String place;

  @nullable
  @JsonKey(includeIfNull: false)
  String website;

  @nullable
  @JsonKey(includeIfNull: false)
  DateTime date;

  @nullable
  @JsonKey(includeIfNull: false)
  String image;

  @nullable
  @JsonKey(includeIfNull: false)
  User user;

  @nullable
  @JsonKey(name: 'user_reserved', includeIfNull: false)
  User userReserved;

  @nullable
  @JsonKey(name: 'user_request', includeIfNull: false)
  User userRequest;

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
