import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'عقارات', 'icon': Icons.home_work, 'color': Colors.orange},
    {'name': 'سيارات', 'icon': Icons.directions_car, 'color': Colors.red},
    {'name': 'مطاعم', 'icon': Icons.restaurant, 'color': Colors.yellow},
    {'name': 'وظائف', 'icon': Icons.work, 'color': Colors.blue},
    {'name': 'أزياء', 'icon': Icons.checkroom, 'color': Colors.purple},
    {'name': 'إلكترونيات', 'icon': Icons.devices, 'color': Colors.cyan},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("المتجر الشامل", style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: Icon(Icons.search, color: Color(0xFFD4AF37)), onPressed: () {})],
      ),
      body: Column(
        children: [
          // قسم التصنيفات العلوي
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: categories[index]['color'].withOpacity(0.2),
                      child: Icon(categories[index]['icon'], color: categories[index]['color']),
                    ),
                    SizedBox(height: 5),
                    Text(categories[index]['name'], style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
          Divider(color: Colors.white10),
          // عرض المنتجات المقترحة
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemCount: 4,
              itemBuilder: (context, index) => _buildProductCard(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container(width: double.infinity, decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.vertical(top: Radius.circular(15))), child: Icon(Icons.image, color: Colors.white24))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("منتج تجريبي $index", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("٤٥,٠٠٠ ر.ي", style: TextStyle(color: Color(0xFFD4AF37))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
