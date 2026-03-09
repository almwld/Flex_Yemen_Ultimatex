import 'package:flutter/material.dart';
import '../widgets/auction_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: const [
        Text("المزادات الأكثر رواجاً ⚡", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 15),
        AuctionCard(
          title: "لاندكروزر 2024 VXR - جديد",
          price: "85,000 $",
          image: "https://images.unsplash.com/photo-1594568284297-7c64464062b1?q=80&w=1000&auto=format&fit=crop",
          duration: Duration(hours: 5, minutes: 30),
        ),
        AuctionCard(
          title: "ساعة رولكس ديت جست - ذهب",
          price: "12,500 $",
          image: "https://images.unsplash.com/photo-1587836374828-4dbaba94cf0e?q=80&w=1000&auto=format&fit=crop",
          duration: Duration(hours: 2, minutes: 15),
        ),
      ],
    );
  }
}
