import 'package:flutter/material.dart';

class CustomTextLabel extends StatelessWidget {
  const CustomTextLabel({
    super.key,
    required this.label,
    required this.text,
    this.textAlign,
    this.fontSize,
  });

  final String label;
  final String? text;
  final TextAlign? textAlign;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.left,
      text: TextSpan(
        text: label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
        children: [
          TextSpan(
            text: text != null ? ' $text' : '',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
