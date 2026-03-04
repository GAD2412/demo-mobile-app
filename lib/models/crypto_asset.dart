import 'package:flutter/material.dart';

//  Crypto Data Model
class CryptoAsset {
  final String symbol;
  final String name;
  final String price;
  final String change;
  final bool isUp;
  final Color color;
  final IconData icon;

  const CryptoAsset({
    required this.symbol,
    required this.name,
    required this.price,
    required this.change,
    required this.isUp,
    required this.color,
    required this.icon,
  });
}
