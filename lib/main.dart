import "package:flex_yemen/screens/wallet_screen.dart";
import "package:flex_yemen/screens/store_screen.dart";
import "package:flex_yemen/screens/chat_list_screen.dart";
import "package:flex_yemen/screens/profile_screen.dart";
import "package:flex_yemen/screens/map_screen.dart";
import "package:flex_yemen/screens/map_screen.dart";
import "package:flex_yemen/screens/profile_screen.dart";
import "package:flex_yemen/screens/chat_list_screen.dart";
import "package:flex_yemen/screens/store_screen.dart";
import "package:flex_yemen/screens/wallet_screen.dart";
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://pivihjmxpydxidpghszs.supabase.co',
    anonKey: 'YOUR_ANON_KEY', 
  );
  runApp(const FlexYemenApp());
}

class FlexYemenApp extends StatelessWidget {
  const FlexYemenApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: const Color(0xFFFFD700), scaffoldBackgroundColor: Colors.black),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const MapScreen(),
    const StoreScreen(),
    const WalletScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddSheet(context),
        backgroundColor: const Color(0xFFFFD700),
        child: const Icon(Icons.add, color: Colors.black, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: const Color(0xFF1A1A1A),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home_outlined, "الرئيسية", 0),
            _buildNavItem(Icons.map_outlined, "الخرائط", 1),
            _buildNavItem(Icons.store_outlined, "المتجر", 2),
            const SizedBox(width: 40),
            _buildNavItem(Icons.account_balance_wallet_outlined, "المحفظة", 3),
            _buildNavItem(Icons.chat_outlined, "الدردشة", 4),
            _buildNavItem(Icons.person_outline, "حسابي", 5),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSel = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: isSel ? const Color(0xFFFFD700).withOpacity(0.1) : Colors.transparent, borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, color: isSel ? const Color(0xFFFFD700) : Colors.grey, size: 22),
          Text(label, style: TextStyle(color: isSel ? const Color(0xFFFFD700) : Colors.grey, fontSize: 9)),
        ]),
      ),
    );
  }

  void _showAddSheet(BuildContext context) {
    showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.transparent, builder: (context) => const AddProductSheet());
  }
}

// شاشات التطبيق الأساسية
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("فلكس يمن", style: TextStyle(color: Color(0xFFFFD700))), backgroundColor: Colors.black),
      body: ListView(children: [
        const Padding(padding: EdgeInsets.all(15), child: Text("مزادات حية 🔥", style: TextStyle(fontSize: 18, color: Colors.redAccent))),
        _buildAuctionCard(),
      ]),
    );
  }

  Widget _buildAuctionCard() {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.redAccent.withOpacity(0.3))),
      child: const Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("تويوتا لاندكروزر 2024", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("02:45:12", style: TextStyle(color: Colors.redAccent)),
        ]),
        SizedBox(height: 10),
        Text("السوم الحالي: 45,000 \$", style: TextStyle(color: Color(0xFFFFD700))),
      ]),
    );
  }
}

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("المتجر الشامل")),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(15),
        children: [
          _cat(Icons.restaurant, "مطاعم", Colors.orange),
          _cat(Icons.directions_car, "سيارات", Colors.red),
          _cat(Icons.home, "عقارات", Colors.brown),
          _cat(Icons.devices, "إلكترونيات", Colors.blue),
          _cat(Icons.checkroom, "أزياء", Colors.purple),
          _cat(Icons.work, "وظائف", Colors.indigo),
        ],
      ),
    );
  }
  Widget _cat(IconData i, String n, Color c) => Column(children: [Icon(i, color: c, size: 30), Text(n, style: const TextStyle(fontSize: 12))]);
}

class MapScreen extends StatelessWidget { const MapScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("الخرائط"))); }
class WalletScreen extends StatelessWidget { const WalletScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("المحفظة"))); }
class ChatScreen extends StatelessWidget { const ChatScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("الدردشة"))); }
class ProfileScreen extends StatelessWidget { const ProfileScreen({super.key}); @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("حسابي"))); }

class AddProductSheet extends StatelessWidget {
  const AddProductSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(color: Color(0xFF1A1A1A), borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text("إضافة إعلان جديد", style: TextStyle(color: Color(0xFFFFD700), fontSize: 18)),
        const TextField(decoration: InputDecoration(hintText: "اسم المنتج")),
        const Spacer(),
        ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFD700)), child: const Text("نشر الآن", style: TextStyle(color: Colors.black))),
      ]),
    );
  }
}
