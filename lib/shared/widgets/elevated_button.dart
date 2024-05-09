  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.textColor,
    required this.backgroundColor,
    this.style,
    this.padding,
  });

  final VoidCallback? onPressed;
  final TextStyle? style;
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor: backgroundColor,
          padding: padding,
          minimumSize: const Size.fromHeight(40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide.none,
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: style ??
              GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
        ));
  }
}
