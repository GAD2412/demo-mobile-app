import 'package:flutter/material.dart';

// Blurred ambient orb
class Orb extends StatelessWidget {
  final Color color;
  final double size;

  const Orb({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.12),
        boxShadow: [BoxShadow(color: color.withOpacity(0.25), blurRadius: size)],
      ),
    );
  }
}
