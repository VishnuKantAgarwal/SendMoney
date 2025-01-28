import 'package:json_annotation/json_annotation.dart';

part 'balance.g.dart';

@JsonSerializable()
class Balance {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "amount")
  double? amount;

  Balance({this.id, this.amount});

  factory Balance.fromJson(Map<String, dynamic> json) => _$BalanceFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceToJson(this);
}
