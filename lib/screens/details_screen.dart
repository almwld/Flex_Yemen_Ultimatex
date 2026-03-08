import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String price;
  final String location;
  final String description;

  const DetailsScreen({
    super.key,
    required this.title,
    required this.price,
    required this.location,
    this.description = "هذا العرض حصري لمشتركي فلكس يمن، يشمل التوصيل والضمان لمدة عام كامل في كافة فروعنا.",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color(0xFF1A1A1A),
                child: const Icon(Icons.image, size: 100, color: Colors.white24),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFD4AF37)),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                      Text(price, style: const TextStyle(fontSize: 20, color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey, size: 16),
                      Text(" $location", style: const TextStyle(color: Colors.grey)),
                      const Spacer(),
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const Text(" 4.9 (١٢٠ تقييم)", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  const Divider(color: Colors.white10, height: 40),
                  const Text("تفاصيل العرض", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 10),
                  Text(description, style: const TextStyle(color: Colors.white70, height: 1.6)),
                  const SizedBox(height: 30),
                  _buildActionButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomOrderBar(),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _iconBtn(Icons.chat_bubble_outline, "دردشة"),
        _iconBtn(Icons.call_outlined, "اتصال"),
        _iconBtn(Icons.share_outlined, "مشاركة"),
        _iconBtn(Icons.favorite_border, "حفظ"),
      ],
    );
  }

  Widget _iconBtn(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(backgroundColor: const Color(0xFF1A1A1A), child: Icon(icon, color: const Color(0xFFD4AF37))),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
      ],
    );
  }

  Widget _buildBottomOrderBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF151515),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD4AF37),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_checkout, color: Colors.black),
            SizedBox(width: 10),
            Text("إضافة للسلة", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
