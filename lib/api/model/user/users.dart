import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class Users {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "password")
  String? password;


  Users({this.id, this.name, this.username, this.password});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
