import 'package:json_annotation/json_annotation.dart';
part 'no_of_years.g.dart';

@JsonSerializable(createToJson: false)
class NoOfYears {
  NoOfYears({
    required this.labelText,
    required this.textColor,
    required this.textSize,
    required this.values,
  });
  final String labelText;
  final double textSize;
  final String textColor;
  final Map<String, String> values;

  factory NoOfYears.fromJson(json) => _$NoOfYearsFromJson(json);
}
