import 'package:flutter/material.dart';

class MapsExplorerScreen extends StatefulWidget {
  const MapsExplorerScreen({super.key});

  @override
  State<MapsExplorerScreen> createState() => _MapsExplorerScreenState();
}

class _MapsExplorerScreenState extends State<MapsExplorerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("متاجر فلكس القريبة", style: TextStyle(color: Color(0xFFD4AF37))),
        backgroundColor: Colors.black,
        actions: [
          IconButton(icon: const Icon(Icons.gps_fixed, color: Color(0xFFD4AF37)), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          // خلفية الخريطة (محاكاة)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://user-images.githubusercontent.com/placeholder-map.png"), // استبدال بخرائط جوجل لاحقاً
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
          ),
          
          // شعار Flex على الخريطة (Custom Markers)
          _buildFlexMarker(top: 150, left: 100, storeName: "سوبر ماركت الهدى"),
          _buildFlexMarker(top: 300, left: 220, storeName: "إلكترونيات القمة"),
          _buildFlexMarker(top: 450, left: 80, storeName: "مطاعم الشيباني"),

          // لوحة معلومات المتجر السفلى
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: _buildStoreDetailsCard(),
          ),
        ],
      ),
    );
  }

  Widget _buildFlexMarker({required double top, required double left, required String storeName}) {
    return Positioned(
      top: top,
      left: left,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5), border: Border.all(color: const Color(0xFFD4AF37))),
            child: Text(storeName, style: const TextStyle(color: Colors.white, fontSize: 10)),
          ),
          const Icon(Icons.location_on, color: Color(0xFFD4AF37), size: 40),
          // شعار Flex صغير فوق العلامة
          const CircleAvatar(radius: 8, backgroundColor: Colors.black, child: Text("F", style: TextStyle(color: Color(0xFFD4AF37), fontSize: 10, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _buildStoreDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(width: 60, height: 60, decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.store, color: Color(0xFFD4AF37))),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("سوبر ماركت الهدى", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("خدمة Flex متوفرة: (سحب، إيداع، دفع)", style: TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),
          const Icon(Icons.directions, color: Color(0xFFD4AF37), size: 30),
        ],
      ),
    );
  }
}
