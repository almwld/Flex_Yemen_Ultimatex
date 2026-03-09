import 'package:flutter/material.dart';

void main() {
  runApp(const FlexYemenApp());
}

class FlexYemenApp extends StatelessWidget {
  const FlexYemenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'فلكس يمن',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFFD700), // الذهبي
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Arial', // يمكنك تغيير الخط لاحقاً
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

  // القائمة الكاملة للواجهات المطلوبة
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
        onPressed: () {
          // هنا يتم تفعيل إضافة منشور أو طلب جديد
        },
        backgroundColor: const Color(0xFFFFD700),
        child: const Icon(Icons.add, color: Colors.black, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: const Color(0xFF1A1A1A),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(Icons.home_outlined, "الرئيسية", 0),
              _buildNavItem(Icons.map_outlined, "الخرائط", 1),
              _buildNavItem(Icons.store_mall_directory_outlined, "المتجر", 2),
              const SizedBox(width: 40), // مساحة للزر المركزي
              _buildNavItem(Icons.account_balance_wallet_outlined, "المحفظة", 3),
              _buildNavItem(Icons.chat_outlined, "الدردشة", 4),
              _buildNavItem(Icons.person_outline, "حسابي", 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFFFFD700) : Colors.grey,
            size: 26,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFFFFD700) : Colors.grey,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// --- 1. واجهة المتجر (الشبكة الملونة) ---
class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'name': 'برايم', 'icon': Icons.stars, 'color': Colors.amber},
      {'name': 'سوبر ماركت', 'icon': Icons.shopping_cart, 'color': Colors.green},
      {'name': 'مطاعم', 'icon': Icons.fastfood, 'color': Colors.orange},
      {'name': 'إلكترونيات', 'icon': Icons.laptop_mac, 'color': Colors.blue},
      {'name': 'ملبوسات', 'icon': Icons.checkroom, 'color': Colors.purple},
      {'name': 'ألعاب', 'icon': Icons.sports_esports, 'color': Colors.red},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("FLEX YEMEN STORE", style: TextStyle(color: Color(0xFFFFD700), letterSpacing: 1.2)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(categories[index]['icon'], color: categories[index]['color'], size: 35),
                const SizedBox(height: 10),
                Text(categories[index]['name'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          );
        },
      ),
    );
  }
}

// --- 2. واجهة الخرائط (تمثيل أولي) ---
class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("خرائط فلكس الذكية")),
      body: Container(
        color: Colors.grey[900],
        child: const Center(child: Icon(Icons.location_on, size: 100, color: Color(0xFFFFD700))),
      ),
    );
  }
}

// --- باقي الواجهات ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("واجهة العروض والإعلانات الرئيسية"));
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Icon(Icons.account_balance_wallet, size: 80, color: Colors.green));
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("نظام الدردشة والوساطة الآمنة"));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Icon(Icons.person_pin, size: 80, color: Color(0xFFFFD700)));
}
