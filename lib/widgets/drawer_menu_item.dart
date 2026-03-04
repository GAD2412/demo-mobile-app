import 'package:flutter/material.dart';
import '../models/menu_item.dart' as model;
import '../constants/colors.dart';
import 'pressable_widget.dart';

//  Drawer Menu Item
class DrawerMenuItem extends StatelessWidget {
  final model.MenuItem item;
  const DrawerMenuItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return PressableWidget(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row( // [3.2.4.1]
          children: [
            Icon(item.icon, color: kCyan, size: 20),
            const SizedBox(width: 16),
            Text(item.label,
              style: const TextStyle(color: Colors.white70,
                  fontSize: 15, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
