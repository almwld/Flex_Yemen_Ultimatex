import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // بيانات تجريبية للسلة
  List<Map<String, dynamic>> cartItems = [
    {'name': 'عطر فلكس الملكي', 'price': 15000, 'qty': 1},
    {'name': 'ساعة ذكية Pro', 'price': 25000, 'qty': 2},
  ];

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(0, (sum, item) => sum + (item['price'] * item['qty']));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("سلة المشتريات", style: TextStyle(color: Color(0xFFD4AF37))),
        backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, i) => Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Container(width: 60, height: 60, decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(10))),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItems[i]['name'], style: const TextStyle(color: Colors.white)),
                          Text("${cartItems[i]['price']} ر.ي", style: const TextStyle(color: Color(0xFFD4AF37))),
                        ],
                      ),
                    ),
                    _buildQtyController(i),
                  ],
                ),
              ),
            ),
          ),
          _buildCheckoutBar(total),
        ],
      ),
    );
  }

  Widget _buildQtyController(int i) {
    return Row(
      children: [
        IconButton(icon: const Icon(Icons.remove_circle_outline, color: Colors.grey), onPressed: () {}),
        Text("${cartItems[i]['qty']}", style: const TextStyle(color: Colors.white)),
        IconButton(icon: const Icon(Icons.add_circle_outline, color: Color(0xFFD4AF37)), onPressed: () {}),
      ],
    );
  }

  Widget _buildCheckoutBar(double total) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Color(0xFF151515), borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("الإجمالي النهائي:", style: TextStyle(color: Colors.white, fontSize: 16)),
              Text("$total ر.ي", style: const TextStyle(color: Color(0xFFD4AF37), fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), minimumSize: const Size(double.infinity, 50)),
            child: const Text("تأكيد الطلب وإرسال", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
