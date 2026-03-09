import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة الاتصال باستخدام مفاتيحك التي قدمتها سابقاً
  await Supabase.initialize(
    url: 'https://pivihjmxpydxidpghszs.supabase.co',
    anonKey: 'YOUR_ANON_KEY_FROM_PREVIOUS_CHATS', // سيقوم Codemagic باستخدام المفاتيح المسجلة
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
        onPressed: () {},
        backgroundColor: const Color(0xFFFFD700),
        child: const Icon(Icons.add, color: Colors.black, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: const Color(0xFF1A1A1A),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home_outlined, "الرئيسية", 0),
            _buildNavItem(Icons.map_outlined, "الخرائط", 1),
            _buildNavItem(Icons.store_outlined, "المتجر", 2),
            const SizedBox(width: 40),
            _buildNavItem(Icons.account_balance_wallet_outlined, "المحفظة", 3),
            _buildNavItem(Icons.chat_outlined, "الدردشة", 4),
            _buildNavItem(Icons.person_outline, "حسابي", 5),
          ],
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

// سيتم جلب البيانات الفعلية هنا لاحقاً
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("واجهة العروض الحية من Supabase"));
}

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("المتجر الشامل"));
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("رادار المواقع الحية"));
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final client = Supabase.instance.client;
    return Scaffold(
      appBar: AppBar(title: const Text("محفظة فلكس")),
      body: Center(
        child: StreamBuilder(
          stream: client.from('profiles').stream(primaryKey: ['id']).execute(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            return const Text("رصيدك الحالي يتم تحديثه لحظياً...");
          },
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("الدردشة المشفرة"));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("إدارة الحساب الموثق"));
}
