import "screens/notifications_screen.dart";
import "screens/cart_screen.dart";
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
      title: 'Flex Yemen V2', // اسم النسخة الجديدة
      theme: ThemeData(
        brightness: Brightness.dark, themeMode: ThemeMode.system,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFD4AF37),
      ),
      home: const MainNavigation(),
    );
  }
}

// ... بقية كود MainNavigation (نفس السابق)
