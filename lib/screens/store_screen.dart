import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("المتجر الشامل")),
      body: const Center(child: Text("هنا تصنيفات المنتجات 🛍️")),
    );
  }
}
