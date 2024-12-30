import 'package:flutter/material.dart';

class MiniProgressBar extends StatelessWidget {
  const MiniProgressBar({super.key, required this.label, required this.value});

  final String label;
  final int value;
  final double maxValue = 5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          LinearProgressIndicator(
            value: value / maxValue,
            backgroundColor: Colors.grey[200],
            color: Colors.blue,
            minHeight: 10,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
