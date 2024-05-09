import 'package:flutter/material.dart';

class DropDownField<T> extends StatelessWidget {
  const DropDownField(
      {required this.value,
      required this.onChanged,
      required this.labelText,
      required this.items,
      required this.labelStyle,
      super.key});

  final String labelText;

  final TextStyle labelStyle;

  final Function(T? value) onChanged;

  final T? value;

  final List<DropdownMenuItem<T>>? items;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      items: items,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
      ),
    );
  }
}
