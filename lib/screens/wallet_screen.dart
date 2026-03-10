import 'package:flutter/material.dart';
import '../core/constants.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("محفظة فلكس", style: TextStyle(color: AppColors.gold))),
      body: const Center(child: Text("الرصيد: 0.00 ريال يمني 💰")),
    );
  }
}
