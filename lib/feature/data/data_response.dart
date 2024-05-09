import 'package:calculator_app/feature/data/index.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data_response.g.dart';

@JsonSerializable(createToJson: false)
class DataResponse {
  DataResponse({
    required this.rateOfInterest,
    required this.principalAmount,
    required this.compoundData,
    required this.noOfYears,
    required this.outputData,
  });
  final RateOfInterest rateOfInterest;
  final PrincipalAmount principalAmount;
  @JsonKey(name: 'compound')
  final CompoundData compoundData;
  final NoOfYears noOfYears;
  @JsonKey(name: 'outputValue')
  final OutputData outputData;

  factory DataResponse.fromJson(json) => _$DataResponseFromJson(json);

  static DataResponse fromJsonMap(Map<String, dynamic> json) {
    return DataResponse(
      rateOfInterest: RateOfInterest.fromJson(json['rateOfInterest']),
      principalAmount: PrincipalAmount.fromJson(json['principalAmount']),
      compoundData: CompoundData.fromJson(json['compound']),
      noOfYears: NoOfYears.fromJson(json['noOfYears']),
      outputData: OutputData.fromJson(json['outputValue']),
    );
  }
}
