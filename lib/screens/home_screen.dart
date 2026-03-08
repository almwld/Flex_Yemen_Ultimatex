import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. شريط البحث
            _buildSearchBar(),

            // 2. شريط الأقسام الشامل (المتحرك)
            _buildComprehensiveCategories(),

            // 3. محرك الـ 5 سلايدر (إعلانات المتجر الذكية)
            _buildSmartAdSliders(),

            // 4. بانرات المنتجات الـ 10 (عروض وتخفيضات)
            _buildProductBanners(),
            
            const SizedBox(height: 20),
            const Text("بناء: Flex_Ultimate_V2.0.1", style: TextStyle(color: Colors.white10, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "ابحث عن مطعم، فندق، أو عقار...",
          prefixIcon: const Icon(Icons.search, color: Color(0xFFD4AF37)),
          filled: true,
          fillColor: const Color(0xFF1A1A1A),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
        ),
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

  // آلية الإعلانات الذكية (Smart Ad Logic)
  Widget _buildSmartAdSliders() {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, i) {
          // محاكاة منطق AI: تغيير لون السلايدر بناءً على نوع الإعلان
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: NetworkImage("https://via.placeholder.com/400x180/D4AF37/000000?text=Smart+Ad+Targeting"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [Colors.black.withOpacity(0.8), Colors.transparent]),
              ),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Align(alignment: Alignment.bottomRight, child: Text("إعلان مخصص لك", style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold))),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductBanners() {
    return Column(
      children: List.generate(10, (i) => Container(
        height: 120,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          children: [
            Container(width: 100, decoration: BoxDecoration(color: Colors.grey[900], borderRadius: const BorderRadius.horizontal(right: Radius.circular(15)))),
            const SizedBox(width: 15),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("عرض حصري أسبوعي", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("تخفيضات تصل إلى ٤٠٪", style: TextStyle(color: Colors.red, fontSize: 12)),
              ],
            )
          ],
        ),
      )),
    );
  }
}
