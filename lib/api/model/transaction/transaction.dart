import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "amount")
  double? amount;
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "list")
  List<Transaction>? list;


  Transaction({this.id, this.amount, this.time, this.list});

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
