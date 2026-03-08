import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/wallet_screen.dart';

void main() {
  runApp(const FlexYemenApp());
}

class FlexYemenApp extends StatelessWidget {
  const FlexYemenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flex Yemen',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // المكان الصحيح هنا
      theme: ThemeData(
        primarySwatch: Colors.amber,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
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
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFD4AF37),
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF1A1A1A),
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'الدردشة'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }
}
