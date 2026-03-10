import 'package:flutter/material.dart';
import '../core/constants.dart';

class StoreSectionsScreen extends StatelessWidget {
  const StoreSectionsScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'title': 'السيارات', 'icon': Icons.directions_car_filled_outlined, 'count': '150+ إعلان'},
    {'title': 'العقارات', 'icon': Icons.home_work_outlined, 'count': '80+ إعلان'},
    {'title': 'الجوالات', 'icon': Icons.phone_android_outlined, 'count': '300+ إعلان'},
    {'title': 'المزادات', 'icon': Icons.gavel_rounded, 'count': '25 مزاد حي'},
    {'title': 'النوادر', 'icon': Icons.Workspace_premium_outlined, 'count': '12 قطعة'},
    {'title': 'الإلكترونيات', 'icon': Icons.laptop_mac_outlined, 'count': '95 إعلان'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("أقسام المتجر", style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // شريط البحث السريع داخل الأقسام
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                hintText: "ابحث عن قسم أو منتج...",
                prefixIcon: const Icon(Icons.search, color: AppColors.gold),
                filled: true,
                fillColor: AppColors.darkGrey,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
          ),
          
          // شبكة الأقسام
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return _buildCategoryCard(
                  categories[index]['title'],
                  categories[index]['icon'],
                  categories[index]['count'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, String count) {
    return InkWell(
      onTap: () {
        // الانتقال لمنتجات القسم لاحقاً
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white10),
          boxShadow: [
            BoxShadow(color: AppColors.gold.withOpacity(0.05), blurRadius: 10, spreadRadius: 1),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.gold, size: 40),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 5),
            Text(count, style: const TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
