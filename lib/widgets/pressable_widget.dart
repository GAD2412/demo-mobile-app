import 'package:flutter/material.dart';

//  Pressable Widget – Smooth Tap Physics (scale 0.95)
//  Uses GestureDetector + AnimatedScale (no external packages)
class PressableWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  const PressableWidget({super.key, required this.child, this.onTap});

  @override
  State<PressableWidget> createState() => _PressableWidgetState();
}

class _PressableWidgetState extends State<PressableWidget> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown:   (_) => setState(() => _pressed = true),
      onTapUp:     (_) { setState(() => _pressed = false); widget.onTap?.call(); },
      onTapCancel: ()  => setState(() => _pressed = false),
      // AnimatedScale provides smooth spring-back
      child: AnimatedScale(
        scale: _pressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOutBack,
        child: widget.child,
      ),
    );
  }
}
