import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("تتبع طلباتي", style: TextStyle(color: Color(0xFFD4AF37))),
        backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildOrderCard("طلب رقم #9821", "قيد المعالجة", 0, Colors.orange),
          _buildOrderCard("طلب رقم #9750", "في الطريق إليك", 1, Colors.blue),
          _buildOrderCard("طلب رقم #9601", "تم التسليم بنجاح", 2, Colors.green),
        ],
      ),
    );
  }

  Widget _buildOrderCard(String orderID, String status, int step, Color statusColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(orderID, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                child: Text(status, style: TextStyle(color: statusColor, fontSize: 11)),
              ),
            ],
          ),
          const Divider(color: Colors.white10, height: 30),
          _buildTimeline(step),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A1A1A),
              side: const BorderSide(color: Color(0xFFD4AF37)),
              minimumSize: const Size(double.infinity, 40),
            ),
            child: const Text("تفاصيل الفاتورة", style: TextStyle(color: Color(0xFFD4AF37), fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(int currentStep) {
    return Row(
      children: [
        _timelineDot(Icons.check_circle, "تم الطلب", currentStep >= 0),
        _timelineLine(currentStep >= 1),
        _timelineDot(Icons.local_shipping, "بالطريق", currentStep >= 1),
        _timelineLine(currentStep >= 2),
        _timelineDot(Icons.home, "وصل", currentStep >= 2),
      ],
    );
  }

  Widget _timelineDot(IconData icon, String label, bool isActive) {
    return Column(
      children: [
        Icon(icon, color: isActive ? const Color(0xFFD4AF37) : Colors.grey, size: 24),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(color: isActive ? Colors.white : Colors.grey, fontSize: 9)),
      ],
    );
  }

  Widget _timelineLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? const Color(0xFFD4AF37) : Colors.white10,
        margin: const EdgeInsets.only(bottom: 15),
      ),
    );
  }
}
