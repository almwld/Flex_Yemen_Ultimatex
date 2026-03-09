import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // تهيئة سوبابيز بمفاتيحك الخاصة
  await Supabase.initialize(
    url: 'https://pivihjmxpydxidpghszs.supabase.co',
    anonKey: 'YOUR_ANON_KEY_HERE', // استبدلها بمفتاحك الذي قدمته سابقا
  );
  
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
        primaryColor: const Color(0xFFFFD700),
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
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const AddProductSheet(),
          );
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
              const SizedBox(width: 40),
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
          Icon(icon, color: isSelected ? const Color(0xFFFFD700) : Colors.grey, size: 24),
          Text(label, style: TextStyle(color: isSelected ? const Color(0xFFFFD700) : Colors.grey, fontSize: 10)),
        ],
      ),
    );
  }
}

// --- الواجهة الرئيسية ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("فلكس يمن", style: TextStyle(color: Color(0xFFFFD700))), backgroundColor: Colors.black),
      body: const Center(child: Text("واجهة العروض والإعلانات الرئيسية")),
    );
  }
}

// --- واجهة المتجر ---
class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cats = [
      {"n": "برايم", "i": Icons.stars, "c": Colors.amber},
      {"n": "مطاعم", "i": Icons.fastfood, "c": Colors.orange},
      {"n": "سوبر ماركت", "i": Icons.shopping_cart, "c": Colors.green},
      {"n": "إلكترونيات", "i": Icons.laptop, "c": Colors.blue},
      {"n": "سيارات", "i": Icons.car_rental, "c": Colors.red},
      {"n": "عقارات", "i": Icons.home, "c": Colors.brown},
      {"n": "أزياء", "i": Icons.checkroom, "c": Colors.purple},
      {"n": "صحة", "i": Icons.medical_services, "c": Colors.teal},
      {"n": "خدمات", "i": Icons.build, "c": Colors.blueGrey},
      {"n": "وظائف", "i": Icons.work, "c": Colors.indigo},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("المتجر الشامل")),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: cats.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(cats[index]['i'], color: cats[index]['c']),
            Text(cats[index]['n'], style: const TextStyle(fontSize: 10)),
          ]),
        ),
      ),
    );
  }
}

// --- واجهة الخرائط ---
class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Icon(Icons.map, size: 100, color: Color(0xFFFFD700))));
  }
}

// --- واجهة المحفظة ---
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("محفظة فلكس يمن")));
  }
}

// --- واجهة الدردشة ---
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("نظام الدردشة والوساطة")));
  }
}

// --- واجهة حسابي ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Icon(Icons.person, size: 100, color: Color(0xFFFFD700))));
  }
}

// --- واجهة إضافة منتج جديد ---
class AddProductSheet extends StatelessWidget {
  const AddProductSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(color: Color(0xFF1A1A1A), borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("إضافة إعلان جديد", style: TextStyle(fontSize: 20, color: Color(0xFFFFD700))),
          const SizedBox(height: 20),
          const TextField(decoration: InputDecoration(hintText: "اسم المنتج")),
          const SizedBox(height: 10),
          const TextField(decoration: InputDecoration(hintText: "السعر"), keyboardType: TextInputType.number),
          const Spacer(),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFD700), minimumSize: const Size(double.infinity, 50)),
            child: const Text("نشر الآن", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
