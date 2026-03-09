import 'package:flutter/material.dart';
import '../widgets/auction_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [
          AuctionCard(
            title: "لاندكروزر 2024 - وكالة",
            price: "125,000 \$",
            timeLeft: "02:45:10",
            imageUrl: "https://picsum.photos/200",
          ),
          AuctionCard(
            title: "عقيق يماني أحمر نادر",
            price: "500 \$",
            timeLeft: "05:12:00",
            imageUrl: "https://picsum.photos/201",
          ),
        ],
      ),
    );
  }
}
