import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/menu_item.dart' as model;
import '../data/mock_data.dart';
import '../widgets/glass_box.dart';
import '../widgets/pressable_widget.dart';
import '../widgets/action_button.dart';
import '../widgets/crypto_list_item.dart';
import '../widgets/mini_stat.dart';
import '../widgets/neon_border.dart';
import '../widgets/orb.dart';
import '../widgets/custom_vertical_divider.dart';
import '../widgets/drawer_menu_item.dart';

class NexusDashboard extends StatefulWidget {
  const NexusDashboard({super.key});
  @override
  State<NexusDashboard> createState() => _NexusDashboardState();
}

class _NexusDashboardState extends State<NexusDashboard>
    with SingleTickerProviderStateMixin {

  final ValueNotifier<bool> _drawerOpenNotifier = ValueNotifier<bool>(false);

  // Breathing animation controller for the balance card
  late final AnimationController _breathCtrl;
  late final Animation<double> _breathAnim;

  @override
  void initState() {
    super.initState();
    _breathCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _breathAnim = Tween<double>(begin: -4.0, end: 4.0).animate(
      CurvedAnimation(parent: _breathCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _drawerOpenNotifier.dispose();
    _breathCtrl.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    _drawerOpenNotifier.value = !_drawerOpenNotifier.value;
  }

  //  Build 
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final drawerWidth = (screenWidth * 0.75).clamp(200.0, 300.0);

    return Scaffold(
      backgroundColor: kBg,
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta! > 10 && !_drawerOpenNotifier.value) {
            _drawerOpenNotifier.value = true;
          } else if (details.primaryDelta! < -10 && _drawerOpenNotifier.value) {
            _drawerOpenNotifier.value = false;
          }
        },
        child: ValueListenableBuilder<bool>(
          valueListenable: _drawerOpenNotifier,
          builder: (context, isDrawerOpen, _) {
            return Stack(
              children: [
                // ① Ambient background orbs
                _buildBackgroundOrbs(),

                // ② Glassmorphic side menu 
                _buildCustomDrawer(isDrawerOpen, drawerWidth),

                // ③ Main dashboard panel
                AnimatedContainer(
                  duration: const Duration(milliseconds: 420),
                  curve: Curves.easeInOutCubic,
                  transform: Matrix4.identity()
                    ..translate(isDrawerOpen ? drawerWidth - 20 : 0.0, 0.0, 0.0)
                    ..scale(isDrawerOpen ? 0.85 : 1.0),
                  transformAlignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: kBg,
                    borderRadius: isDrawerOpen
                        ? BorderRadius.circular(28)
                        : BorderRadius.zero,
                    boxShadow: isDrawerOpen
                        ? [BoxShadow(color: kCyan.withOpacity(0.18), blurRadius: 40)]
                        : [],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: _buildDashboardContent(isDrawerOpen),
                ),

                // ④ Tap-outside-drawer to close
                if (isDrawerOpen)
                  Positioned(
                    left: drawerWidth,
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => _drawerOpenNotifier.value = false,
                      behavior: HitTestBehavior.opaque,
                      child: const SizedBox.expand(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Background decorative orbs 
  Widget _buildBackgroundOrbs() {
    return const Stack(
      children: [
        Positioned(
          top: -80, left: -60,
          child: Orb(color: kPurple, size: 280),
        ),
        Positioned(
          bottom: -60, right: -80,
          child: Orb(color: kCyan, size: 240),
        ),
        Positioned(
          top: 300, right: -40,
          child: Orb(color: kGold, size: 180),
        ),
      ],
    );
  }

  // Custom Glassmorphic Side Drawer
  Widget _buildCustomDrawer(bool isDrawerOpen, double drawerWidth) {
    return Positioned(
      left: 0, top: 0, bottom: 0,
      width: drawerWidth, // Dynamically sized
      child: AnimatedOpacity(
        opacity: isDrawerOpen ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 320),
        child: GlassBox(
          borderRadius: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  // Avatar + name
                  const Row( 
                    children: [
                      NeonBorder(
                        color: kCyan,
                        borderWidth: 2,
                        radius: 30,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: kCard,
                          child: Icon(Icons.person_outline, color: kCyan, size: 28),
                        ),
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('0xA3b7…F2c1',
                            style: TextStyle(color: kCyan, fontSize: 13,
                                fontWeight: FontWeight.bold)),
                          Text('Nexus PRO',
                            style: TextStyle(color: Colors.white38, fontSize: 11)),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 32),
                  const Divider(color: Colors.white12),
                  const SizedBox(height: 16),

                  // Menu items
                  ...kMenuItems.map((item) => DrawerMenuItem(item: item)),

                  const Spacer(),
                  const Divider(color: Colors.white12),
                  const DrawerMenuItem(item: model.MenuItem(Icons.logout_rounded, 'Disconnect')),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Dashboard main content 
  Widget _buildDashboardContent(bool isDrawerOpen) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // App bar
          SliverToBoxAdapter(child: _buildTopBar(isDrawerOpen)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGreeting(),
                  const SizedBox(height: 20),
                  _buildBalanceCard(),
                  const SizedBox(height: 28),
                  _buildQuickActions(),
                  const SizedBox(height: 28),
                  _sectionHeader('Your Assets'),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),

          // Crypto list items
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, i) => Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: CryptoListItem(asset: kAssets[i]),
              ),
              childCount: kAssets.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  //  Top Bar 
  Widget _buildTopBar(bool isDrawerOpen) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Hamburger
          Semantics(
            label: 'Open Menu',
            child: Tooltip(
              message: 'Menu',
              child: PressableWidget(
                onTap: _toggleDrawer,
                child: GlassBox(
                  padding: const EdgeInsets.all(10),
                  child: AnimatedRotation(
                    turns: isDrawerOpen ? 0.125 : 0.0,
                    duration: const Duration(milliseconds: 380),
                    child: const Icon(Icons.menu_rounded, color: kCyan, size: 22),
                  ),
                ),
              ),
            ),
          ),

          // Logo
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kCyan.withOpacity(0.5), width: 1.5),
                  boxShadow: [BoxShadow(color: kCyan.withOpacity(0.3), blurRadius: 10)],
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/image/nexus_logo.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, color: kCyan, size: 20),
                ),
              ),
              const SizedBox(width: 12),
              ShaderMask(
                shaderCallback: (r) => const LinearGradient(
                  colors: [kCyan, kPurple],
                ).createShader(r),
                child: const Text('NEXUS',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 6,
                    color: Colors.white,
                  )),
              ),
            ],
          ),

          // Notification bell
          Semantics(
            label: 'Notifications',
            child: Tooltip(
              message: 'Notifications',
              child: PressableWidget(
                onTap: () {},
                child: GlassBox(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.notifications_outlined, color: kCyan, size: 22),
                      Positioned(
                        top: -2, right: -2,
                        child: Container(
                          width: 8, height: 8,
                          decoration: const BoxDecoration(
                            color: kRed, shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //  Greeting 
  Widget _buildGreeting() {
    return const Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Good evening, Trader 👋',
          style: TextStyle(color: Colors.white54, fontSize: 14)),
        SizedBox(height: 4),
        Text('Your Nexus Portfolio',
          style: TextStyle(color: Colors.white,
              fontSize: 22, fontWeight: FontWeight.bold)),
      ],
    );
  }

  //  Balance Card (Breathing Animation) 
  Widget _buildBalanceCard() {
    return AnimatedBuilder(
      animation: _breathAnim,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _breathAnim.value),
          child: child,
        );
      },
      child: PressableWidget(
        onTap: () {},
        child: GlassBox(
          gradient: const LinearGradient(
            colors: [Color(0x33651FFF), Color(0x110099CC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          padding: const EdgeInsets.all(24),
          borderColor: kCyan.withOpacity(0.35),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Balance',
                    style: TextStyle(color: Colors.white54, fontSize: 13)),
                  GlassBox(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row( 
                      children: [
                        Container(width: 7, height: 7,
                          decoration: const BoxDecoration(
                            color: kGreen, shape: BoxShape.circle)),
                        const SizedBox(width: 6),
                        const Text('LIVE', style: TextStyle(
                            color: kGreen, fontSize: 10,
                            fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              ShaderMask(
                shaderCallback: (r) => const LinearGradient(
                  colors: [Colors.white, kCyan],
                ).createShader(r),
                child: const Text('\$142,830.72',
                  style: TextStyle(fontSize: 40,
                      fontWeight: FontWeight.w900, color: Colors.white)),
              ),

              const SizedBox(height: 10),

              Row( 
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: kGreen.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: kGreen.withOpacity(0.4)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.arrow_upward_rounded,
                            color: kGreen, size: 13),
                        SizedBox(width: 4),
                        Text('+8.34% today',
                          style: TextStyle(color: kGreen,
                              fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('+\$10,923.11',
                    style: TextStyle(color: Colors.white38, fontSize: 12)),
                ],
              ),

              const SizedBox(height: 16),
              const Divider(color: Colors.white12),
              const SizedBox(height: 14),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MiniStat(label: 'Assets', value: '14'),
                  CustomVerticalDivider(),
                  MiniStat(label: 'Networks', value: '6'),
                  CustomVerticalDivider(),
                  MiniStat(label: 'NFTs', value: '32'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Quick Action Buttons 
  Widget _buildQuickActions() {
    return const Row( 
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(label: 'Send',    icon: Icons.arrow_upward_rounded,   color: kCyan),
        ActionButton(label: 'Receive', icon: Icons.arrow_downward_rounded, color: kPurple),
        ActionButton(label: 'Swap',    icon: Icons.swap_horiz_rounded,     color: kGold),
        ActionButton(label: 'Buy',     icon: Icons.add_rounded,            color: kGreen),
      ],
    );
  }

  //  Section Header 
  Widget _sectionHeader(String title) {
    return Row( 
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
        TextButton(
          onPressed: () {},
          child: const Text('See all', style: TextStyle(color: kCyan, fontSize: 12)),
        ),
      ],
    );
  }
}
