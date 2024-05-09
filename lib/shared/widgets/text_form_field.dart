import 'package:calculator_app/shared/utility/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomEditText extends StatefulWidget {
  const CustomEditText({
    super.key,
    this.suffixIcon,
    this.labelTextColor,
    this.borderRadius,
    required this.labelText,
    this.hintText = '',
    this.focusNode,
    this.obscureText = false,
    this.enabled = true,
    this.margin,
    this.style,
    this.inputTextStyle,
    this.extraInfoStyle,
    this.wrapTextStyle,
    this.wrapText = '',
    this.extraInfoText = '',
    this.infoIcon = false,
    this.errorText = '',
    this.hintStyle,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
    this.maxLines,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.controller,
    this.onIconTap,
    this.textFormKey,
  });

  final Key? textFormKey;
  final Widget? suffixIcon;
  final String wrapText;
  final TextStyle? wrapTextStyle;
  final TextStyle? style;
  final TextStyle? inputTextStyle;
  final String extraInfoText;
  final TextStyle? extraInfoStyle;
  final FocusNode? focusNode;
  final Color? labelTextColor;
  final String labelText;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool obscureText;
  final bool enabled;
  final bool infoIcon;
  final VoidCallback? onIconTap;
  final EdgeInsets? margin;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final double? borderRadius;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomEditText> createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.labelText,
          style: widget.style ??
              GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          cursorColor: ColorUtils.azul,
          key: widget.textFormKey,
          style: widget.inputTextStyle ??
              GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
          smartQuotesType: SmartQuotesType.disabled,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines ?? 1,
          enableSuggestions: false,
          autocorrect: false,
          initialValue: widget.initialValue,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          controller: widget.controller,
          enabled: widget.enabled,
          focusNode: _focusNode,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorUtils.dividerColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 2),
            ),
            counterText: '',
            suffixIcon: widget.suffixIcon,
            contentPadding: const EdgeInsets.all(10),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ??
                GoogleFonts.poppins(
                  fontStyle: FontStyle.normal,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
            border: InputBorder.none,
            enabledBorder: widget.errorText != null
                ? widget.errorText != null
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorUtils.tomatoTwo,
                          width: 2,
                        ),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius ?? 5),
                      )
                    : OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorUtils.paleGreyFour,
                          width: 1,
                        ),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius ?? 5),
                      )
                : OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorUtils.paleGreyFour,
                      width: 1,
                    ),
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 5),
                  ),
            fillColor: widget.enabled
                ? Colors.white
                : ColorUtils.dividerColor.withOpacity(0.3),
            filled: true,
            errorStyle: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: ColorUtils.tomatoTwo,
              ),
            ),
            errorText: widget.errorText,
            errorMaxLines: 3,
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
            ),
          ),
        ),
      ],
    );
  }
}
