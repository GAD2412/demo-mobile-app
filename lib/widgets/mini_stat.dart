import 'package:flutter/material.dart';

// Mini stat cell in balance card
class MiniStat extends StatelessWidget {
  final String label, value;
  const MiniStat({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column( // [3.2.4.2]
      children: [
        Text(value, style: const TextStyle(color: Colors.white,
            fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.white38, fontSize: 11)),
      ],
    );
  }
}
