import 'package:built_value/built_value.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:piczzie/model/user.dart';

part 'child.g.dart';

@JsonSerializable()
class Child {
  @nullable
  @JsonKey(name: '_id', includeIfNull: false)
  String id;

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
  @JsonKey(name: 'birthday', includeIfNull: false)
  DateTime birthday;

  @nullable
  @JsonKey(name: 'parent', includeIfNull: false)
  User parent;

  @override
    Child(
      {this.id,
      this.firstname,
      this.lastname,
      this.gender,
      this.birthday,
      this.parent});


  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);

  Map<String, dynamic> toJson() => _$ChildToJson(this);
}