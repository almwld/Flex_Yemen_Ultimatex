import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          backgroundColor: const Color(0xFF1A1A1A),
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

// --- كل الشاشات مدمجة هنا لضمان نجاح البناء ---

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("فلكس يمن - الرئيسية", style: TextStyle(color: Color(0xFFD4AF37), fontSize: 20))));
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(15.3521, 44.2163), // صنعاء بدون const
        initialZoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.flex_yemen.ultimatex',
        ),
      ],
    );
  }
}

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("المتجر الشامل")));
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("المحفظة الرقمية")));
}

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("قائمة الدردشات")));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("الملف الشخصي")));
}
