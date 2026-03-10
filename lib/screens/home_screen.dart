import 'package:flutter/material.dart';
import '../core/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.settings_outlined, color: AppColors.gold),
        title: const Text("FLEX YEMEN", style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.shopping_bag_outlined, color: AppColors.gold),
              Positioned(
                top: 12, right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: const Text("16", style: TextStyle(fontSize: 8, color: Colors.white)),
                ),
              )
            ],
          ),
          const SizedBox(width: 15),
          const Icon(Icons.wb_sunny_outlined, color: AppColors.gold),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. شريط البحث
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(color: AppColors.darkGrey, borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "...ابحث عن ما تريد",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),

            // 2. تصنيفات سريعة (Chips)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  _buildQuickChip("شحن ألعاب"),
                  _buildQuickChip("سفر"),
                  _buildQuickChip("عقارات"),
                  _buildQuickChip("مطاعم"),
                ],
              ),
            ),

            // 3. البانر الإعلاني (مزاد الجنابي)
            Container(
              margin: const EdgeInsets.all(15),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.orange, Colors.redAccent]),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text("مزاد الجنابي\nالأسبوعي", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ),

            // 4. قسم العقارات والاستثمارات
            _buildSectionHeader("🏠 العقارات والاستثمارات"),
            _buildCategoryGrid([
              {'title': 'أراضي استثمارية', 'icon': Icons.stars, 'color': Colors.blue},
              {'title': 'فلل للبيع', 'icon': Icons.stars, 'color': Colors.blue},
              {'title': 'شقق للإيجار', 'icon': Icons.stars, 'color': Colors.blue},
              {'title': 'مقاولات بناء', 'icon': Icons.stars, 'color': Colors.blue},
              {'title': 'مخططات سكنية', 'icon': Icons.stars, 'color': Colors.blue},
              {'title': 'مكاتب تجارية', 'icon': Icons.stars, 'color': Colors.blue},
            ]),

            // 5. قسم الإلكترونيات
            _buildSectionHeader("📱 عالم الإلكترونيات والتقنية"),
            _buildCategoryGrid([
              {'title': 'ستارلينك وإنترنت', 'icon': Icons.stars, 'color': Colors.purple},
              {'title': 'لابتوب وكمبيوتر', 'icon': Icons.stars, 'color': Colors.purple},
              {'title': 'هواتف ذكية', 'icon': Icons.stars, 'color': Colors.purple},
            ]),

            // 6. شبكة المزادات (التي صممناها سابقاً)
            _buildSectionHeader("🔥 مزادات حية"),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(10),
              childAspectRatio: 0.8,
              children: [
                _buildAuctionCard("جنبية صيفاني قديمة", "5,000", "00:02:34"),
                _buildAuctionCard("شاص 2024", "35,000", "00:12:33"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickChip(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white24)),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildCategoryGrid(List<Map<String, dynamic>> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.1),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(color: AppColors.darkGrey, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(items[index]['icon'], color: items[index]['color'], size: 20),
              const SizedBox(height: 8),
              Text(items[index]['title'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 10)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAuctionCard(String title, String price, String time) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.gold.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Expanded(child: Container(decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(10)), margin: const EdgeInsets.all(8))),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$$price", style: const TextStyle(color: AppColors.gold, fontSize: 11)),
                Text(time, style: const TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
