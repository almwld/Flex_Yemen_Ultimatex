import 'dart:ui';
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
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: AppBar(
              title: const Text("FLEX YEMEN", 
                style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.w900, letterSpacing: 2, fontSize: 22)),
              centerTitle: true,
              backgroundColor: Colors.black.withOpacity(0.6),
              elevation: 0,
              shape: const Border(bottom: BorderSide(color: Color(0x33D4AF37), width: 0.5)),
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0x44D4AF37), width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white.withOpacity(0.05),
              selectedItemColor: const Color(0xFFD4AF37),
              unselectedItemColor: Colors.white38,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'الرئيسية'),
                BottomNavigationBarItem(icon: Icon(Icons.explore_rounded), label: 'الخريطة'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded), label: 'المتجر'),
                BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_rounded), label: 'المحفظة'),
                BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_rounded), label: 'الدردشة'),
                BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'حسابي'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// الشاشات الأخرى (HomeScreen, MapScreen الخ) تبقى كما هي...
class HomeScreen extends StatelessWidget { const HomeScreen({super.key}); @override Widget build(BuildContext context) => const Center(child: Text("فلكس يمن - الرئيسية")); }
class MapScreen extends StatelessWidget { const MapScreen({super.key}); @override Widget build(BuildContext context) => const Center(child: Text("الخريطة الحية")); }

// --- واجهة المتجر الجديدة والاحترافية ---
class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // شريط البحث الملكي
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0x44D4AF37)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Color(0xFFD4AF37)),
                    hintText: "ابحث عن سيارات، عقارات، إلكترونيات...",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ),
            ),
          ),
          
          // شبكة الأقسام الرئيسية
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, childAspectRatio: 1.1,
              ),
              delegate: SliverChildListDelegate([
                _buildCategoryCard(context, Icons.car_repair, "سيارات ومحركات", Colors.blue),
                _buildCategoryCard(context, Icons.home_work, "عقارات وأراضي", Colors.orange),
                _buildCategoryCard(context, Icons.phone_android, "جوالات وأجهزة", Colors.green),
                _buildCategoryCard(context, Icons.fastfood, "مطاعم وتوصيل", Colors.redAccent),
              ]),
            ),
          ),
          
          // قسم "المنتجات المميزة"
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("وصلنا حديثاً", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                TextButton(onPressed: () {}, child: const Text("عرض الكل", style: TextStyle(color: Color(0xFFD4AF37)))),
              ]),
            ),
          ),
          
          // شبكة المنتجات (مثال بسيط)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, bottom: 100), // مساحة للشريط السفلي
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.75,
              ),
              delegate: SliverChildListDelegate([
                _buildProductCard("تويوتا لاندكروزر 2024", "45,000 $", "https://img.freepik.com/premium-photo/luxury-suv-car-isolated-black-background_8130-1033.jpg"),
                _buildProductCard("فيلا فاخرة في صنعاء", "150M YER", "https://img.freepik.com/premium-photo/beautiful-modern-house-exterior-with-swimming-pool_8130-117.jpg"),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, IconData icon, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x33D4AF37), width: 0.5),
        boxShadow: [BoxShadow(color: color.withOpacity(0.1), blurRadius: 10, spreadRadius: 1)],
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, color: color, size: 40),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 5),
        Text("25 إعلان نشط", style: TextStyle(color: color.withOpacity(0.7), fontSize: 10)),
      ]),
    );
  }

  Widget _buildProductCard(String title, String price, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(15)), child: Image.network(imageUrl, height: 120, width: double.infinity, fit: BoxFit.cover)),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12), maxLines: 2),
            const SizedBox(height: 5),
            Text(price, style: const TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
          ]),
        ),
      ]),
    );
  }
}

// باقي الشاشات تبقى كما هي...
class WalletScreen extends StatelessWidget { const WalletScreen({super.key}); @override Widget build(BuildContext context) => const Center(child: Text("المحفظة الذهبية")); }
class ChatListScreen extends StatelessWidget { const ChatListScreen({super.key}); @override Widget build(BuildContext context) => const Center(child: Text("المحادثات")); }
class ProfileScreen extends StatelessWidget { const ProfileScreen({super.key}); @override Widget build(BuildContext context) => const Center(child: Text("الملف الشخصي")); }
