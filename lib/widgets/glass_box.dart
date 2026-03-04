import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

//  [3.2.3.6] Glassmorphism Widget
//  Uses Stack + ClipRRect + BackdropFilter (ImageFilter.blur)
class GlassBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  final Gradient? gradient;
  final Color? borderColor;

  const GlassBox({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
    this.borderRadius = 18,
    this.gradient,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    // [3.2.3.6] Stack + ClipRRect + BackdropFilter + Positioned
    return ClipRRect(                         // [3.2.3.6] ClipRRect
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(                           // [3.2.3.6] Stack
        children: [
          // Frosted glass blur layer
          BackdropFilter(                     // [3.2.3.6] BackdropFilter
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: Container(
              decoration: BoxDecoration(
                gradient: gradient,
                color: gradient == null ? kGlass : null,
                border: Border.all(
                  color: borderColor ?? Colors.white12, width: 1.0),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          // Content on top
          Padding(padding: padding, child: child),
        ],
      ),
    );
  }
}
