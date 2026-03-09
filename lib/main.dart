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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFD700).withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFFFFD700) : Colors.grey.withOpacity(0.6),
              size: 24,
            ),
            const SizedBox(height: 4),
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
      {"n": "فلكس برايم", "i": Icons.workspace_premium, "c": Color(0xFFFFD700)},
      {"n": "المطاعم", "i": Icons.restaurant, "c": Colors.orange},
      {"n": "سوبر ماركت", "i": Icons.shopping_bag, "c": Colors.green},
      {"n": "إلكترونيات", "i": Icons.devices, "c": Colors.blue},
      {"n": "السيارات", "i": Icons.directions_car, "c": Colors.red},
      {"n": "العقارات", "i": Icons.location_city, "c": Colors.brown},
      {"n": "أزياء", "i": Icons.checkroom, "c": Colors.purple},
      {"n": "صحة وجمال", "i": Icons.spa, "c": Colors.pink},
      {"n": "صيانة", "i": Icons.handyman, "c": Colors.blueGrey},
      {"n": "وظائف", "i": Icons.badge, "c": Colors.indigo},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("المتجر الشامل")),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: cats.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: (cats[index]["c"] as Color).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(cats[index]["i"], color: cats[index]["c"], size: 28),
              ),
              const SizedBox(height: 8),
              Text(cats[index]["n"], style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white70)),
            ],
          ),
        ),
        ],
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final String title;
  final String price;
  final String category;

  const ProductDetailsScreen({
    super.key, 
    required this.title, 
    required this.price, 
    required this.category
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // رأس الصفحة مع صورة المنتج
              SliverAppBar(
                expandedHeight: 350,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      image: const DecorationImage(
                        image: NetworkImage("https://via.placeholder.com/600x600"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(color: const Color(0xFFFFD700).withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                            child: Text(category, style: const TextStyle(color: Color(0xFFFFD700), fontSize: 12)),
                          ),
                          const Text("منذ ساعتين", style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(price, style: const TextStyle(fontSize: 22, color: Color(0xFFFFD700), fontWeight: FontWeight.bold)),
                      const SizedBox(height: 25),
                      
                      // بطاقة البائع الموثق
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            const CircleAvatar(radius: 25, backgroundColor: Colors.grey, child: Icon(Icons.person)),
                            const SizedBox(width: 15),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("معرض البركة", style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(width: 5),
                                    Icon(Icons.verified, color: Colors.blue, size: 16),
                                  ],
                                ),
                                Text("بائع موثوق في صنعاء", style: TextStyle(color: Colors.grey, fontSize: 12)),
                              ],
                            ),
                            const Spacer(),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios, size: 16)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text("وصف المنتج", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      const Text(
                        "هذا المنتج متوفر بحالة ممتازة مع ضمانة فحص شاملة. متوفر في فرعنا الرئيسي بصنعاء - شارع الستين. تواصل معنا لمزيد من التفاصيل.",
                        style: TextStyle(color: Colors.grey, height: 1.5),
                      ),
                      const SizedBox(height: 100), // مساحة للأزرار السفلية
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // أزرار الإجراءات السفلية (Floating)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withOpacity(0), Colors.black]),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFD700), padding: const EdgeInsets.symmetric(vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                      child: const Text("شراء عبر الوساطة", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15)),
                    child: IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline, color: Color(0xFFFFD700))),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15)),
                    child: IconButton(onPressed: () {}, icon: const Icon(Icons.phone_outlined, color: Colors.green)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchResultsOverlay extends StatelessWidget {
  final String query;
  const SearchResultsOverlay({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: const Color(0xFF1A1A1A),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.history, color: Colors.grey),
          title: Text("نتيجة البحث عن $query"),
          onTap: () {},
        ),
      ),
    );
  }
}

class AuctionCard extends StatelessWidget {
  final String title;
  final String currentBid;
  final String timeLeft;

  const AuctionCard({super.key, required this.title, required this.currentBid, required this.timeLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFFD700).withOpacity(0.2)),
        boxShadow: [BoxShadow(color: Colors.red.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.timer, color: Colors.red, size: 16),
                      const SizedBox(width: 5),
                      Text(timeLeft, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    const Text("أعلى سومة", style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Text(currentBid, style: const TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFD700),
              minimumSize: const Size(double.infinity, 45),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("زايد الآن", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
