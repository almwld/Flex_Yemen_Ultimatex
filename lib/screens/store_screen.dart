import 'package:flutter/material.dart';
import '../core/constants.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("المتجر الشامل", style: TextStyle(color: AppColors.gold))),
      body: const Center(child: Text("قريباً: شبكة المنتجات اليمنية 🛍️")),
    );
  }
}
