import 'package:json_annotation/json_annotation.dart';
part 'rate_of_interest.g.dart';

@JsonSerializable(createToJson: false)
class RateOfInterest {
  RateOfInterest({
    required this.labelText,
    required this.textColor,
    required this.textSize,
    required this.values,
  });
  final String labelText;
  final double textSize;
  final String textColor;
  final Map<String, String> values;

  factory RateOfInterest.fromJson(json) => _$RateOfInterestFromJson(json);
}
