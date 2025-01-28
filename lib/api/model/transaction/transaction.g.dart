// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: (json['id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      time: json['time'] as String?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'time': instance.time,
      'list': instance.list,
    };
