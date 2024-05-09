import 'package:json_annotation/json_annotation.dart';
part 'output_data.g.dart';

@JsonSerializable(createToJson: false)
class OutputData {
  OutputData({
    required this.labelText,
    required this.textColor,
    required this.textSize,
    required this.modeOfDisplay,
  });
  final String labelText;
  final double textSize;
  final String textColor;
  final String modeOfDisplay;

  factory OutputData.fromJson(json) => _$OutputDataFromJson(json);
}
