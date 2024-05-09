// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'principal_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrincipalAmount _$PrincipalAmountFromJson(Map<String, dynamic> json) =>
    PrincipalAmount(
      hintText: json['hintText'] as String,
      textColor: json['textColor'] as String,
      textSize: (json['textSize'] as num).toDouble(),
      maximumAmount: (json['maximumAmount'] as num).toDouble(),
      minErrorMessage: json['minErrorMessage'] as String,
      maxErrorMessage: json['maxErrorMessage'] as String,
      minimumAmount: Map<String, int>.from(json['minimumAmount'] as Map),
    );
