// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Balance _$BalanceFromJson(Map<String, dynamic> json) => Balance(
      id: (json['id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
    };
