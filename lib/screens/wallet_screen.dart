import 'package:flutter/material.dart';
import '../core/constants.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المحفظة الرقمية", style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة الرصيد الذهبية
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.gold, Color(0xFFB8860B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [BoxShadow(color: AppColors.gold.withOpacity(0.3), blurRadius: 20, spreadRadius: 2)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("إجمالي الرصيد المتوفر", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text("1,250,000 YER", style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.black)),
                  const SizedBox(height: 5),
                  const Text("≈ 2,100 USD", style: TextStyle(color: Colors.black45, fontSize: 14)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _walletAction(Icons.add_card, "شحن"),
                      _walletAction(Icons.outbox, "سحب"),
                      _walletAction(Icons.swap_horiz, "تحويل"),
                    ],
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            const Text("آخر العمليات", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // قائمة العمليات الحقيقية
            _transactionItem("بيع: شاص 2024", "+ 35,000 $", "منذ ساعتين", Colors.green),
            _transactionItem("شحن رصيد: كريمي", "+ 50,000 YER", "أمس", Colors.green),
            _transactionItem("رسوم إعلان مميز", "- 5,000 YER", "3 مارس", Colors.redAccent),
            _transactionItem("سحب رصيد: النجم", "- 100,000 YER", "1 مارس", Colors.redAccent),
          ],
        ),
      ),
    );
  }

  Widget _walletAction(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(backgroundColor: Colors.black26, child: Icon(icon, color: Colors.black)),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _transactionItem(String title, String amount, String date, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(date, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            ],
          ),
          Text(amount, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );
  }
}
