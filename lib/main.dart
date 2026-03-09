import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flex_yemen/screens/home_screen.dart';
import 'package:flex_yemen/screens/map_screen.dart';
import 'package:flex_yemen/screens/store_screen.dart';
import 'package:flex_yemen/screens/wallet_screen.dart';
import 'package:flex_yemen/screens/chat_list_screen.dart';
import 'package:flex_yemen/screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ربط بيانات Supabase الحقيقية
  await Supabase.initialize(
    url: 'https://efbc36e3fdd1428c96d0.supabase.co',
    anonKey: 'efbc36e3-fdd1-428c-a96d-0dd8038fadb1',
  );

  runApp(const FlexYemenApp());
}

class FlexYemenApp extends StatefulWidget {
  const FlexYemenApp({super.key});

  @override
  State<FlexYemenApp> createState() => _FlexYemenAppState();
}

class _FlexYemenAppState extends State<FlexYemenApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MapScreen(),
    const StoreScreen(),
    const WalletScreen(),
    const ChatListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFD4AF37),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFD4AF37),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'الخريطة'),
            BottomNavigationBarItem(icon: Icon(Icons.store), label: 'المتجر'),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'المحفظة'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'الدردشة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}
