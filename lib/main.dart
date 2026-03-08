import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/map_screen.dart';
import 'screens/store_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/profile_screen.dart';

void main() => runApp(const FlexYemenApp());

class FlexYemenApp extends StatelessWidget {
  const FlexYemenApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFD4AF37),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 2; // البدء من المتجر كما في طلبك

  final List<Widget> _pages = [
    const HomeScreen(), const MapScreen(), const StoreScreen(),
    const Center(child: Text("إضافة")), const WalletScreen(),
    const ChatScreen(), const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.settings_outlined, color: Color(0xFFD4AF37)),
        title: const Text("FLEX YEMEN", style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          _buildCartIcon(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.wb_sunny_outlined, color: Color(0xFFD4AF37)),
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF151515),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                _navItem(Icons.home_filled, "الرئيسية", 0),
                _navItem(Icons.map_outlined, "الخرائط", 1),
                _navItem(Icons.storefront_outlined, "المتجر", 2),
              ]),
              Row(children: [
                _navItem(Icons.account_balance_wallet_outlined, "المحفظة", 4),
                _navItem(Icons.chat_bubble_outline_rounded, "دردشة", 5),
                _navItem(Icons.person_outline_rounded, "حسابي", 6),
              ]),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _currentIndex = 3),
        backgroundColor: const Color(0xFFD4AF37),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.black, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCartIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Icon(Icons.shopping_cart_outlined, color: Color(0xFFD4AF37)),
        Positioned(
          right: 0, top: 12,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
            constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
            child: const Text('6', style: TextStyle(color: Colors.white, fontSize: 8), textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: _currentIndex == index ? const Color(0xFFD4AF37) : Colors.grey, size: 22),
            Text(label, style: TextStyle(color: _currentIndex == index ? const Color(0xFFD4AF37) : Colors.grey, fontSize: 9)),
          ],
        ),
      ),
    );
  }
}
