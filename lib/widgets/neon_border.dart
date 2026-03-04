import 'package:flutter/material.dart';

// Neon border circle
class NeonBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderWidth;
  final double radius;

  const NeonBorder({
    super.key,
    required this.child,
    required this.color,
    required this.borderWidth,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: borderWidth),
        boxShadow: [BoxShadow(color: color.withOpacity(0.5), blurRadius: 12)],
      ),
      child: child,
    );
  }
}
