import 'package:flutter/material.dart';
import '../models/crypto_asset.dart';
import '../constants/colors.dart';
import 'pressable_widget.dart';

//  [3.2.4.1] Crypto List Item  – Row layout: logo | name | price
// Optimized: Replaced BackdropFilter (GlassBox) with a pure Container color
class CryptoListItem extends StatelessWidget {
  final CryptoAsset asset;
  const CryptoListItem({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return PressableWidget(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: kGlass, // solid translucent background instead of BackdropFilter
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white12, width: 1.0),
        ),
        child: Row( // [3.2.4.1] Logo · Name · Price · Trend
          children: [
            // — Logo circle
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: asset.color.withOpacity(0.12),
                border: Border.all(color: asset.color.withOpacity(0.45), width: 1.5),
                boxShadow: [BoxShadow(color: asset.color.withOpacity(0.3), blurRadius: 12)],
              ),
              child: Icon(asset.icon, color: asset.color, size: 20),
            ),

            const SizedBox(width: 14),

            // — Name + symbol  [3.2.4.2]
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(asset.name,
                    style: const TextStyle(color: Colors.white,
                        fontSize: 14, fontWeight: FontWeight.w600)),
                  Text(asset.symbol,
                    style: const TextStyle(color: Colors.white38, fontSize: 12)),
                ],
              ),
            ),

            // — Price + change  [3.2.4.2]
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(asset.price,
                  style: const TextStyle(color: Colors.white,
                      fontSize: 14, fontWeight: FontWeight.bold)),
                Row( // [3.2.4.1] change arrow + text
                  children: [
                    Icon(
                      asset.isUp ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: asset.isUp ? kGreen : kRed, size: 16,
                    ),
                    Text(asset.change,
                      style: TextStyle(
                        color: asset.isUp ? kGreen : kRed,
                        fontSize: 12, fontWeight: FontWeight.w600,
                      )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
