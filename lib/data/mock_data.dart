import 'package:flutter/material.dart';
import '../models/crypto_asset.dart';
import '../models/menu_item.dart';
import '../constants/colors.dart';

const List<CryptoAsset> kAssets = [
  CryptoAsset(symbol: 'BTC',  name: 'Bitcoin',   price: '\$67,420', change: '+2.34%',  isUp: true,  color: kGold,   icon: Icons.currency_bitcoin),
  CryptoAsset(symbol: 'ETH',  name: 'Ethereum',  price: '\$3,812',  change: '+1.08%',  isUp: true,  color: kPurple, icon: Icons.diamond_outlined),
  CryptoAsset(symbol: 'SOL',  name: 'Solana',    price: '\$184.50', change: '+5.67%',  isUp: true,  color: kCyan,   icon: Icons.bolt),
  CryptoAsset(symbol: 'PEPE', name: 'PepeCoin',  price: '\$0.0124', change: '-3.21%',  isUp: false, color: kGreen,  icon: Icons.water_drop_outlined),
  CryptoAsset(symbol: 'ARB',  name: 'Arbitrum',  price: '\$1.24',   change: '-0.88%',  isUp: false, color: Color(0xFF12AAFF), icon: Icons.hub_outlined),
];

const List<MenuItem> kMenuItems = [
  MenuItem(Icons.dashboard_outlined,      'Dashboard'),
  MenuItem(Icons.account_balance_wallet,  'Portfolio'),
  MenuItem(Icons.swap_horiz_rounded,      'Swap'),
  MenuItem(Icons.show_chart_rounded,      'Analytics'),
  MenuItem(Icons.hub_outlined,            'NFT Vault'),
  MenuItem(Icons.settings_outlined,       'Settings'),
];
