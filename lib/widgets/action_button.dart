import 'package:flutter/material.dart';
import 'pressable_widget.dart';

//  Action Button  (Send / Receive / Swap / Buy)
class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const ActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return PressableWidget(
      onTap: () {},
      child: Column( // [3.2.4.2]
        children: [
          Container(
            width: 58, height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.12),
              border: Border.all(color: color.withOpacity(0.5), width: 1.5),
              boxShadow: [BoxShadow(color: color.withOpacity(0.35), blurRadius: 20)],
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white60, fontSize: 12)),
        ],
      ),
    );
  }
}
