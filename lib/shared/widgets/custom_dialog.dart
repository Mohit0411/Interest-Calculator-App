import 'package:calculator_app/shared/utility/index.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.hintText,
    required this.interest,
    required this.style,
  });

  final String hintText;
  final String interest;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              iconSize: 20,
              icon: const Icon(
                Icons.close,
                size: 20,
                color: ColorUtils.primary,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(hintText, style: style),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(interest, style: style),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) => build(context),
        barrierDismissible: false);
  }
}
