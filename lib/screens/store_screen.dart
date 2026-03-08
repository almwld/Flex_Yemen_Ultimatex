import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'title': 'برايم', 'icon': Icons.star, 'color': Colors.amber},
      {'title': 'سوبر ماركت', 'icon': Icons.shopping_basket, 'color': Colors.green},
      {'title': 'مطاعم', 'icon': Icons.restaurant, 'color': Colors.orange},
      {'title': 'إلكترونيات', 'icon': Icons.devices, 'color': Colors.blue},
      {'title': 'ملبوسات', 'icon': Icons.checkroom, 'color': Colors.purple},
      {'title': 'ألعاب', 'icon': Icons.videogame_asset, 'color': Colors.red},
      {'title': 'تعهد حفلات', 'icon': Icons.celebration, 'color': Colors.pink},
      {'title': 'صحة', 'icon': Icons.medical_services, 'color': Colors.teal},
      {'title': 'جمال', 'icon': Icons.brush, 'color': Colors.deepPurpleAccent},
      {'title': 'سيارات', 'icon': Icons.directions_car, 'color': Colors.brown},
      {'title': 'أطفال', 'icon': Icons.child_care, 'color': Colors.lightBlue},
      {'title': 'رياضة', 'icon': Icons.fitness_center, 'color': Colors.redAccent},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white10, width: 0.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(categories[index]['icon'], color: categories[index]['color'], size: 32),
                const SizedBox(height: 10),
                Text(
                  categories[index]['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
