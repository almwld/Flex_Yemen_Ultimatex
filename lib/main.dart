import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/map_screen.dart';
import 'screens/store_screen.dart';

void main() => runApp(const FlexYemenApp());

class FlexYemenApp extends StatelessWidget {
  const FlexYemenApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: const Color(0xFFD4AF37)),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(), const MapScreen(), const StoreScreen(),
    const Center(child: Text("إضافة")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FLEX YEMEN", style: TextStyle(color: Color(0xFFD4AF37)))),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF151515),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.home), onPressed: () => setState(() => _currentIndex = 0)),
            IconButton(icon: const Icon(Icons.map), onPressed: () => setState(() => _currentIndex = 1)),
            IconButton(icon: const Icon(Icons.store), onPressed: () => setState(() => _currentIndex = 2)),
          ],
        ),
      ),
    );
  }
}
