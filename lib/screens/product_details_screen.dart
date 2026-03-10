import 'package:flutter/material.dart';
import '../core/constants.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const ProductDetailsScreen({
    super.key, 
    required this.title, 
    required this.price, 
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // رأس الصفحة مع صورة المنتج الكبيرة
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(image, fit: BoxFit.cover),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.black26,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
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
                      Text(price, style: const TextStyle(color: AppColors.gold, fontSize: 24, fontWeight: FontWeight.bold)),
                      const Icon(Icons.favorite_border, color: AppColors.gold),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 16),
                      Text(" صنعاء - شارع الستين", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const Divider(height: 40, color: Colors.white10),
                  const Text("الوصف", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    "هذا المنتج بحالة ممتازة، تم فحصه بعناية. السعر قابل للتفاوض البسيط للجادين فقط. التواصل عبر الواتساب أو الاتصال المباشر.",
                    style: TextStyle(color: Colors.white70, height: 1.5),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      // أزرار التفاعل السريع في الأسفل
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        color: AppColors.darkGrey,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.call),
                label: const Text("اتصال"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chat_bubble_outline),
                label: const Text("دردشة"),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, foregroundColor: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
