import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// ملاحظة: قمنا بإزالة imports الخرائط مؤقتاً لتبسيط الكود لغرض الواجهة

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
        scaffoldBackgroundColor: Colors.black,
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
  int _selectedIndex = 0;
  
  final List<Widget> _pages = [
    const HomeScreen(),
    const MapScreen(),
    const StoreScreen(),
    const PostAdScreen(), // شاشة إضافة الإعلان
    const WalletScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      // --- الشريط السفلي المدمج بـ 6 أزرار ---
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A1A), // لون الشريط
          border: Border(top: BorderSide(color: Colors.white10, width: 0.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed, // لتوزيع الأزرار بالتساوي
          backgroundColor: Colors.transparent, // شفاف لأن الكونتينر يحمل اللون
          selectedItemColor: const Color(0xFFD4AF37), // اللون الذهبي للنشط
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'الخريطة'),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'المتجر'),
            BottomNavigationBarItem(
              // تمييز زر الإضافة بلون مختلف كما في الصورة
              icon: CircleAvatar(
                backgroundColor: Color(0xFFD4AF37), 
                radius: 18, 
                child: Icon(Icons.add_rounded, color: Colors.black, size: 24)
              ), 
              label: 'إضافة'
            ),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'المحفظة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

// --- تعريف الشاشات ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("فلكس يمن - الرئيسية")));
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("خريطة اليمن")));
}

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("المتجر الشامل")));
}

class PostAdScreen extends StatelessWidget {
  const PostAdScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("واجهة إضافة إعلان جديد")));
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("المحفظة الرقمية")));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("الملف الشخصي")));
}
