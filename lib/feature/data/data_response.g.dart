// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      rateOfInterest: RateOfInterest.fromJson(json['rateOfInterest']),
      principalAmount: PrincipalAmount.fromJson(json['principalAmount']),
      compoundData: CompoundData.fromJson(json['compound']),
      noOfYears: NoOfYears.fromJson(json['noOfYears']),
      outputData: OutputData.fromJson(json['outputValue']),
    );
