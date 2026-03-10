import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الرئيسية", style: TextStyle(color: Color(0xFFD4AF37)))),
      body: const Center(child: Text("هنا المزايدات الحية 🔥")),
    );
  }
}
