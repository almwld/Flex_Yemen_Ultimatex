import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("محفظة فلكس يمن", style: TextStyle(color: Color(0xFFD4AF37))),
        backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          // كرت الرصيد
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFD4AF37), Color(0xFFB8860B)]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                Text("إجمالي الرصيد المتاح", style: TextStyle(color: Colors.black54, fontSize: 14)),
                SizedBox(height: 10),
                Text("٥٤٠,٠٠٠ ر.ي", style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          
          // أزرار العمليات
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _walletAction(Icons.add_card, "إيداع"),
              _walletAction(Icons.outbox, "سحب رصيد"),
              _walletAction(Icons.history, "السجل"),
            ],
          ),
          
          const Divider(color: Colors.white10, height: 40),
          
          // سجل العمليات الأخيرة
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(alignment: Alignment.centerRight, child: Text("آخر العمليات", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, i) => ListTile(
                leading: const CircleAvatar(backgroundColor: Color(0xFF1A1A1A), child: Icon(Icons.arrow_downward, color: Colors.green, size: 16)),
                title: const Text("استلام رصيد - طلب #12", style: TextStyle(color: Colors.white, fontSize: 13)),
                subtitle: const Text("٢٠٢٤/٠٥/١٠", style: TextStyle(color: Colors.grey, fontSize: 11)),
                trailing: const Text("+ ١٥,٠٠٠ ر.ي", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _walletAction(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15)),
          child: Icon(icon, color: const Color(0xFFD4AF37)),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
