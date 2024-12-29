import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key, required this.text, this.textAlign, this.fontSize});

  final String text;
  final TextAlign? textAlign;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.left, style: TextStyle(fontSize: fontSize));
  }
}
