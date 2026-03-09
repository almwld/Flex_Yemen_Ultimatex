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
      {"name": "فلكس برايم", "icon": Icons.workspace_premium, "color": Colors.amber},
      {"name": "مطاعم", "icon": Icons.restaurant, "color": Colors.orange},
      {"name": "سوبر ماركت", "icon": Icons.shopping_basket, "color": Colors.green},
      {"name": "إلكترونيات", "icon": Icons.devices, "color": Colors.blue},
      {"name": "سيارات", "icon": Icons.directions_car, "color": Colors.red},
      {"name": "عقارات", "icon": Icons.home_work, "color": Colors.brown},
      {"name": "موضة وأزياء", "icon": Icons.checkroom, "color": Colors.purple},
      {"name": "صحة وجمال", "icon": Icons.content_cut, "color": Colors.pink},
      {"name": "صيانة وخدمات", "icon": Icons.handyman, "color": Colors.blueGrey},
      {"name": "وظائف وأعمال", "icon": Icons.assignment_ind, "color": Colors.indigo},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("متجر فلكس الشامل", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // شريط البحث الخاص بالمتجر
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Color(0xFFFFD700)),
                  hintText: "ابحث عن منتج أو متجر...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          // شبكة التصنيفات العشرة
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.85,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: categories[index]["color"].withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(categories[index]["icon"], color: categories[index]["color"], size: 30),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          categories[index]["name"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"name": "فلكس برايم", "icon": Icons.workspace_premium, "color": Colors.amber},
      {"name": "مطاعم", "icon": Icons.restaurant, "color": Colors.orange},
      {"name": "سوبر ماركت", "icon": Icons.shopping_basket, "color": Colors.green},
      {"name": "جوالات", "icon": Icons.phone_android, "color": Colors.blue},
      {"name": "سيارات", "icon": Icons.directions_car, "color": Colors.red},
      {"name": "عقارات", "icon": Icons.home, "color": Colors.brown},
      {"name": "أزياء", "icon": Icons.checkroom, "color": Colors.purple},
      {"name": "صحة", "icon": Icons.medical_services, "color": Colors.teal},
      {"name": "خدمات", "icon": Icons.build, "color": Colors.blueGrey},
      {"name": "وظائف", "icon": Icons.work, "color": Colors.indigo},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("متجر فلكس الشامل", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(categories[index]["icon"], color: categories[index]["color"], size: 32),
                const SizedBox(height: 10),
                Text(
                  categories[index]["name"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("رادار فلكس الذكي", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.my_location, color: Color(0xFFFFD700)), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          // خلفية الخريطة (تمثيل بصري تفاعلي)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              image: const DecorationImage(
                image: NetworkImage("https://api.mapbox.com/styles/v1/mapbox/dark-v10/static/44.20,15.35,12/600x600?access_token=YOUR_TOKEN"), // تمثيل لموقع صنعاء
                fit: BoxFit.cover,
                opacity: 0.4,
              ),
            ),
          ),
          // مؤشرات المواقع (Markers)
          const Positioned(top: 150, left: 100, child: _MapMarker(icon: Icons.store, color: Colors.orange, label: "متجر البركة")),
          const Positioned(top: 250, right: 80, child: _MapMarker(icon: Icons.delivery_dining, color: Colors.green, label: "مندوب فلكس")),
          const Positioned(bottom: 200, left: 150, child: _MapMarker(icon: Icons.home, color: Colors.blue, label: "عقار للبيع")),
          
          // شريط البحث والفلترة السفلي
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xFFFFD700).withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Color(0xFFFFD700)),
                  const SizedBox(width: 10),
                  const Expanded(child: Text("ابحث عن محلات أو خدمات قريبة...", style: TextStyle(color: Colors.grey, fontSize: 13))),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(color: const Color(0xFFFFD700), borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.tune, color: Colors.black, size: 20),
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

class _MapMarker extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  const _MapMarker({required this.icon, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [BoxShadow(color: color.withOpacity(0.5), blurRadius: 10)]),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        Container(
          margin: const EdgeInsets.top(5),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(5)),
          child: Text(label, style: const TextStyle(fontSize: 10, color: Colors.white)),
        ),
      ],
    );
  }
}
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "ابحث في فلكس يمن...",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              prefixIcon: Icon(Icons.search, color: Color(0xFFFFD700)),
              border: InputBorder.none,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined, color: Color(0xFFFFD700))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بنر العروض المتحرك
            Container(
              margin: const EdgeInsets.all(15),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFB8860B), Color(0xFFFFD700)]),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(child: Text("عروض الصيف الكبرى", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("الأقسام المميزة", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFFD700))),
            ),
            const SizedBox(height: 10),
            _buildQuickActions(),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text("أحدث الإعلانات", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return SizedBox(
      height: 100,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        _quickActionItem(Icons.directions_car, "سيارات"),
        _quickActionItem(Icons.home, "عقارات"),
        _quickActionItem(Icons.phone_android, "جوالات"),
        _quickActionItem(Icons.work, "وظائف"),
        _quickActionItem(Icons.watch, "ساعات"),
      ]),
    );
  }

  Widget _quickActionItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [
        CircleAvatar(backgroundColor: const Color(0xFF1A1A1A), child: Icon(icon, color: const Color(0xFFFFD700))),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 12)),
      ]),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white10)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: Container(decoration: BoxDecoration(color: Colors.grey[800], borderRadius: const BorderRadius.vertical(top: Radius.circular(12))))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text("منتج فلكس يمن المميز", maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 5),
                const Text("75,000 ريال", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold)),
              ]),
            ),
          ]),
        );
      },
    );
  }
}
  @override
  Widget build(BuildContext context) => const Center(child: Text("واجهة العروض والإعلانات الرئيسية"));
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("محفظة فلكس", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // بطاقة الرصيد الرئيسية
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFB8860B), Color(0xFFFFD700)]),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.amber.withOpacity(0.3), blurRadius: 10)],
              ),
              child: Column(
                children: [
                  const Text("إجمالي الرصيد المتوفر", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text("1,250,000 YER", style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold)),
                  const Divider(color: Colors.black26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMiniBalance("2,500 SAR"),
                      _buildMiniBalance("650 USD"),
                    ],
                  ),
                ],
              ),
            ),
            // أزرار العمليات السريعة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionBtn(Icons.add_circle, "إيداع", Colors.green),
                _buildActionBtn(Icons.arrow_circle_up, "سحب", Colors.red),
                _buildActionBtn(Icons.swap_horizontal_circle, "تحويل", Colors.blue),
              ],
            ),
            const SizedBox(height: 25),
            // قائمة العمليات الأخيرة
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(alignment: Alignment.centerRight, child: Text("العمليات الأخيرة", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFFD700)))),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(backgroundColor: Color(0xFF1A1A1A), child: Icon(Icons.history, color: Colors.grey)),
                  title: const Text("عمولة وساطة - رقم #5432"),
                  subtitle: const Text("12 مارس 2026"),
                  trailing: const Text("+15,000", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniBalance(String amount) {
    return Column(children: [Text(amount, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), const Text("رصيد فرعي", style: TextStyle(color: Colors.black45, fontSize: 10))]);
  }

  Widget _buildActionBtn(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.white10)),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
  @override
  Widget build(BuildContext context) => const Center(child: Icon(Icons.account_balance_wallet, size: 80, color: Colors.green));
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {"name": "محمد الصنعاني", "msg": "هل السعر نهائي للسيارة؟", "time": "10:30 ص", "status": "وساطة نشطة"},
      {"name": "متجر البركة", "msg": "تم تجهيز طلبيتك يا فندم", "time": "9:15 ص", "status": "مكتمل"},
      {"name": "عقارات اليمن", "msg": "موقع الأرض ممتاز جداً", "time": "أمس", "status": "استفسار"},
      {"name": "مركز الدعم", "msg": "كيف يمكننا مساعدتك اليوم؟", "time": "2 مارس", "status": "دعم"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("الدردشة والوساطة", style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.security, color: Colors.green), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // تنبيه الأمان والوساطة
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.green.withOpacity(0.1),
            child: const Row(
              children: [
                Icon(Icons.verified_user, color: Colors.green, size: 20),
                SizedBox(width: 10),
                Expanded(child: Text("نظام الوساطة الذكي مفعّل لحمايتك", style: TextStyle(fontSize: 12, color: Colors.green))),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: chats.length,
              separatorBuilder: (context, index) => const Divider(color: Colors.white10, height: 1),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFF1A1A1A),
                    child: Text(chats[index]["name"]![0], style: const TextStyle(color: Color(0xFFFFD700))),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(chats[index]["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(chats[index]["time"]!, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(chats[index]["msg"]!, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, color: Colors.grey))),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: chats[index]["status"] == "وساطة نشطة" ? Colors.blue.withOpacity(0.2) : Colors.white10,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(chats[index]["status"]!, style: TextStyle(fontSize: 9, color: chats[index]["status"] == "وساطة نشطة" ? Colors.blue : Colors.grey)),
                      ),
                    ],
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
  @override
  Widget build(BuildContext context) => const Center(child: Text("نظام الدردشة والوساطة الآمنة"));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("الملف الشخصي", style: TextStyle(color: Color(0xFFFFD700))),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.settings, color: Colors.grey), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // رأس الصفحة وصورة المستخدم
            Center(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: Color(0xFFFFD700), shape: BoxShape.circle),
                    child: const CircleAvatar(radius: 50, backgroundColor: Color(0xFF1A1A1A), child: Icon(Icons.person, size: 50, color: Colors.grey)),
                  ),
                  Positioned(bottom: 0, right: 0, child: Container(padding: const EdgeInsets.all(4), decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle), child: const Icon(Icons.verified, color: Colors.white, size: 20))),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text("المهندس الهوني", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("بائع ووسيط موثوق - صنعاء", style: TextStyle(color: Colors.grey, fontSize: 13)),
            
            const SizedBox(height: 30),
            // قسم الإحصائيات السريعة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem("إعلاناتي", "12"),
                _buildStatItem("تقييمي", "4.9"),
                _buildStatItem("متابعون", "350"),
              ],
            ),
            
            const SizedBox(height: 30),
            // قائمة الإعدادات والخيارات
            _buildProfileTile(Icons.assignment_turned_in, "توثيق الحساب بالهوية", Colors.blue, "مطلوب"),
            _buildProfileTile(Icons.security, "الأمان وكلمة المرور", Colors.orange, ""),
            _buildProfileTile(Icons.favorite, "المفضلة", Colors.red, ""),
            _buildProfileTile(Icons.help_center, "مركز المساعدة والدعم", Colors.teal, ""),
            _buildProfileTile(Icons.logout, "تسجيل الخروج", Colors.grey, ""),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(children: [Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFFD700))), Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12))]);
  }

  Widget _buildProfileTile(IconData icon, String title, Color color, String trailing) {
    return ListTile(
      leading: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: color, size: 22)),
      title: Text(title, style: const TextStyle(fontSize: 15)),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [if (trailing.isNotEmpty) Text(trailing, style: const TextStyle(color: Colors.red, fontSize: 12)), const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey)]),
      onTap: () {},
    );
  }
}
  @override
  Widget build(BuildContext context) => const Center(child: Icon(Icons.person_pin, size: 80, color: Color(0xFFFFD700)));
}
