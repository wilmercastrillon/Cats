import 'package:cats/shared/atoms/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed});

  final String text;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStatePropertyAll(Theme.of(context).primaryColor),
      ),
      onPressed: onPressed != null ? onPressed!() : null,
      child: CustomText(text: text),
    );
  }
}
