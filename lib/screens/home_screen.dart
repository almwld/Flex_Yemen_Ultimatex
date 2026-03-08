import "details_screen.dart";
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // متغير لتحديد المدينة (يمكن ربطه بـ GPS لاحقاً)
  String selectedCity = "صنعاء"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. شريط اختيار المدينة + البحث
            _buildTopBar(),

            // 2. شريط الأقسام الشامل
            _buildComprehensiveCategories(),

            // 3. محرك الـ 5 سلايدر (إعلانات ذكية حسب المدينة)
            _buildSmartAdSliders(),

            // 4. بانرات العروض الـ 10 (عروض وتخفيضات حصرية)
            _buildProductBanners(),
            
            const SizedBox(height: 20),
            const Text("بناء: Flex_Ultimate_V2.5.0_Settings_Engine", style: TextStyle(color: Colors.white10, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("فلكس يمن - عروض ذكية", style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                value: selectedCity,
                dropdownColor: const Color(0xFF1A1A1A),
                style: const TextStyle(color: Color(0xFFD4AF37), fontSize: 12),
                underline: Container(),
                items: <String>['صنعاء', 'عدن', 'تعز', 'إب', 'المكلا'].map((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value));
                }).toList(),
                onChanged: (val) => setState(() => selectedCity = val!),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: "بحث في عروض $selectedCity...",
              prefixIcon: const Icon(Icons.search, color: Color(0xFFD4AF37)),
              filled: true,
              fillColor: const Color(0xFF1A1A1A),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComprehensiveCategories() {
    final List<Map<String, dynamic>> cats = [
      {'n': 'مطاعم', 'i': Icons.restaurant, 'c': Colors.orange},
      {'n': 'سوبر ماركت', 'i': Icons.shopping_cart, 'c': Colors.green},
      {'n': 'ملبوسات', 'i': Icons.checkroom, 'c': Colors.purple},
      {'n': 'فنادق', 'i': Icons.hotel, 'c': Colors.blue},
      {'n': 'مولات', 'i': Icons.store, 'c': Colors.red},
      {'n': 'إلكترونيات', 'i': Icons.devices, 'c': Colors.teal},
      {'n': 'ألعاب', 'i': Icons.videogame_asset, 'c': Colors.indigo},
      {'n': 'مكتبات', 'i': Icons.menu_book, 'c': Colors.brown},
      {'n': 'صيدليات', 'i': Icons.medical_services, 'c': Colors.pink},
      {'n': 'سيارات', 'i': Icons.directions_car, 'c': Colors.blueGrey},
      {'n': 'عقارات', 'i': Icons.home_work, 'c': Colors.amber},
    ];
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: cats.length,
        itemBuilder: (context, i) => Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15)),
              child: Icon(cats[i]['i'], color: cats[i]['c'], size: 28),
            ),
            Text(cats[i]['n'], style: const TextStyle(color: Colors.white, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildSmartAdSliders() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text("إعلانات مميزة في $selectedCity", style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 180,
          child: PageView.builder(
            itemCount: 5,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF1A1A1A),
                  border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.3)),
                ),
                child: Center(child: Text("إعلان $selectedCity ذكي رقم $i", style: const TextStyle(color: Color(0xFFD4AF37)))),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductBanners() {
    return Column(
      children: List.generate(10, (i) => Container(
        height: 120,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8), child: InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen(title: "عرض حصري ذكي", price: "٤٥,٠٠٠ ر.ي", location: "صنعاء - حدة"))),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          children: [
            Container(width: 8, decoration: const BoxDecoration(color: Color(0xFFD4AF37), borderRadius: BorderRadius.horizontal(right: Radius.circular(15)))),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("تخفيضات أسبوعية في $selectedCity", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const Text("عروض حصرية لمستخدمي فلكس", style: TextStyle(color: Colors.grey, fontSize: 11)),
                const Text("خصم ٤٠٪", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            )
          ],
        ),
      )),
    );
  }
}
