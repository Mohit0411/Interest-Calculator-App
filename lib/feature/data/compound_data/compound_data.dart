import 'package:json_annotation/json_annotation.dart';
part 'compound_data.g.dart';

@JsonSerializable(createToJson: false)
class CompoundData {
  CompoundData({
    required this.labelText,
    required this.textColor,
    required this.textSize,
    required this.values,
  });
  final String labelText;
  final double textSize;
  final String textColor;
  final Map<String, dynamic> values;

  factory CompoundData.fromJson(json) => _$CompoundDataFromJson(json);
}
