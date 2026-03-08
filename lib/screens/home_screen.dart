import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCity = 'صنعاء';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            Image.asset("assets/images/logo.png", height: 30, errorBuilder: (c,e,s) => const Icon(Icons. store, color: Color(0xFFD4AF37))),
            const SizedBox(width: 10),
            const Text("فلكس يمن", style: TextStyle(color: Color(0xFFD4AF37), fontSize: 18)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.smart_toy_rounded, color: Color(0xFFD4AF37)),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen())),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.grey),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen())),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            _buildOfferSlider(),
            _buildCategories(),
            _buildProductGrid(),
            const SizedBox(height: 20),
            const Text("إصدار V3.4.1 - Ultimate", style: TextStyle(color: Colors.white10, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "ابحث عن عقارات، سيارات، خدمات...",
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          prefixIcon: const Icon(Icons.search, color: Color(0xFFD4AF37)),
          filled: true,
          fillColor: const Color(0xFF1A1A1A),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _buildOfferSlider() {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFD4AF37), Color(0xFFB8860B)]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text("عروض حصرية في صنعاء", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _catItem(Icons.home, "عقارات"),
          _catItem(Icons.directions_car, "سيارات"),
          _catItem(Icons.phone_android, "جوالات"),
          _catItem(Icons.work, "وظائف"),
        ],
      ),
    );
  }

  Widget _catItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFFD4AF37)),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15)),
        child: const Center(child: Text("منتج فلكس", style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
