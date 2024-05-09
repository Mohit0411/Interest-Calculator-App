import 'package:json_annotation/json_annotation.dart';
part 'principal_amount.g.dart';

@JsonSerializable(createToJson: false)
class PrincipalAmount {
  PrincipalAmount({
    required this.hintText,
    required this.textColor,
    required this.textSize,
    required this.maximumAmount,
    required this.minErrorMessage,
    required this.maxErrorMessage,
    required this.minimumAmount,
  });
  final String hintText;
  final double textSize;
  final String textColor;
  final double maximumAmount;
  final String minErrorMessage;
  final String maxErrorMessage;
  final Map<String, int> minimumAmount;

  factory PrincipalAmount.fromJson(json) => _$PrincipalAmountFromJson(json);
}
