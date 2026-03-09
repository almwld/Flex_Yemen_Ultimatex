import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flex_yemen/screens/home_screen.dart';
import 'package:flex_yemen/screens/map_screen.dart';
import 'package:flex_yemen/screens/store_screen.dart';
import 'package:flex_yemen/screens/wallet_screen.dart';
import 'package:flex_yemen/screens/chat_list_screen.dart';
import 'package:flex_yemen/screens/profile_screen.dart';
import 'package:flex_yemen/widgets/custom_app_bar.dart';
import 'package:flex_yemen/widgets/custom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ربط القيم الحقيقية لـ Supabase
  await Supabase.initialize(
    url: 'https://efbc36e3fdd1428c96d0.supabase.co', // تم التعديل بناءً على المعرف الخاص بك
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
  bool _isDarkMode = true;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MapScreen(),
    const StoreScreen(),
    const WalletScreen(),
    const ChatListScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: CustomAppBar(
          isDarkMode: _isDarkMode,
          cartCount: 0,
          onThemeToggle: () => setState(() => _isDarkMode = !_isDarkMode),
          onSettingsPressed: () {},
          onCartPressed: () {},
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: CustomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
