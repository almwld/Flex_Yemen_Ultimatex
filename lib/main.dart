import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://efbc36e3fdd1428c96d0.supabase.co',
    anonKey: 'efbc36e3-fdd1-428c-a96d-0dd8038fadb1',
  );
  runApp(const FlexYemenApp());
}

class FlexYemenApp extends StatelessWidget {
  const FlexYemenApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFD4AF37),
        scaffoldBackgroundColor: const Color(0xFF050505),
      ),
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
  int _selectedIndex = 4; // افتراضي على الدردشة للعرض
  final List<Widget> _pages = [
    const HomeScreen(),
    const MapScreen(),
    const StoreScreen(),
    const PostAdScreen(),
    const ChatListScreen(), // واجهة قائمة المحادثات
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A1A),
          border: Border(top: BorderSide(color: Colors.white10, width: 0.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: const Color(0xFFD4AF37),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'الخريطة'),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'المتجر'),
            BottomNavigationBarItem(icon: CircleAvatar(backgroundColor: Color(0xFFD4AF37), radius: 18, child: Icon(Icons.add, color: Colors.black)), label: 'إضافة'),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_rounded), label: 'الدردشة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// --- واجهة قائمة الدردشات (Chat List) ---
class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المحادثات", style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => const Divider(color: Colors.white10, height: 1),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage("https://ui-avatars.com/api/?name=User&background=D4AF37&color=000"),
            ),
            title: Text("أبو محمد الصنعاني ${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("كم السعر النهائي للجنبية؟", style: TextStyle(color: Colors.grey, fontSize: 13)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("10:30 ص", style: TextStyle(color: Colors.grey, fontSize: 10)),
                const SizedBox(height: 5),
                if (index == 0) Container(padding: const EdgeInsets.all(6), decoration: const BoxDecoration(color: Color(0xFFD4AF37), shape: BoxShape.circle), child: const Text("1", style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold))),
              ],
            ),
            onTap: () {
              // هنا ننتقل لصفحة الدردشة المفصلة
            },
          );
        },
      ),
    );
  }
}

// الشاشات الأخرى مؤقتاً
class HomeScreen extends StatelessWidget { const HomeScreen({super.key}); @override Widget build(BuildContext context) => const Center(child: Text("الرئيسية")); }
class MapScreen extends StatelessWidget { const MapScreen({super.key}); @override Widget build(BuildContext context) => const Center(child: Text("الخريطة")); }
class StoreScreen extends StatelessWidget { const StoreScreen({super.key}); @override Widget build(BuildContext context) => const Center(child: Text("المتجر")); }
class PostAdScreen extends StatelessWidget { const PostAdScreen({super.key}); @override Widget build(BuildContext context) => const Center(child: Text("إضافة إعلان")); }
class ProfileScreen extends StatelessWidget { const ProfileScreen({super.key}); @override Widget build(BuildContext context) => const Center(child: Text("حسابي")); }
