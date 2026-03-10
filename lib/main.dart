import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // --- استخدام المفاتيح الصحيحة التي زودتني بها ---
  await Supabase.initialize(
    url: 'https://ziqpohdxtemsmunnhlkm.supabase.co', // تم استخراجه من الـ JWT الخاص بك
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InppcXBvaGR4dGVtc211bm5obGttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE3ODQzNDcsImV4cCI6MjA4NzM2MDM0N30.ABAg5YZSrrAtBTWATJ3eRTmo4BuZVyVlrMV1HZjRWs0',
  );
  
  runApp(const FlexYemenApp());
}

class FlexYemenApp extends StatelessWidget {
  const FlexYemenApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFD4AF37),
        scaffoldBackgroundColor: const Color(0xFF050505),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 4; // نبدأ من الدردشة للتأكد من الواجهة الحقيقية
  
  final List<Widget> _pages = [
    const Center(child: Text("الرئيسية")),
    const MapViewWidget(),
    const Center(child: Text("المتجر")),
    const Center(child: Text("إضافة إعلان")),
    const ChatRoomScreen(),
    const Center(child: Text("حسابي")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A1A),
          border: Border(top: BorderSide(color: Colors.white10, width: 0.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: const Color(0xFFD4AF37),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'الخريطة'),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'المتجر'),
            BottomNavigationBarItem(icon: CircleAvatar(backgroundColor: Color(0xFFD4AF37), radius: 18, child: Icon(Icons.add, color: Colors.black)), label: 'إضافة'),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_rounded), label: 'الدردشة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text("أبو محمد الصنعاني", style: TextStyle(color: Color(0xFFD4AF37))),
        actions: [IconButton(icon: const Icon(Icons.location_on_outlined, color: Color(0xFFD4AF37)), onPressed: () {})],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                _messageBubble("السلام عليكم، أين موقع المحل؟", false),
                _locationBubble("موقعنا في صنعاء - شارع حدة", "15.3211, 44.2012"),
                _messageBubble("تمام، سأصل إليكم خلال ساعة بإذن الله.", true),
              ],
            ),
          ),
          _inputArea(),
        ],
      ),
    );
  }

  Widget _messageBubble(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? const Color(0x33D4AF37) : const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: isMe ? const Color(0xFFD4AF37) : Colors.white10),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _locationBubble(String label, String coords) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: 200,
        decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.white10)),
        child: Column(
          children: [
            Container(height: 100, color: Colors.white10, child: const Icon(Icons.map, color: Color(0xFFD4AF37))),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(label, style: const TextStyle(fontSize: 12))),
          ],
        ),
      ),
    );
  }

  Widget _inputArea() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color(0xFF1A1A1A),
      child: Row(
        children: [
          const Expanded(child: TextField(decoration: InputDecoration(hintText: "اكتب هنا...", border: InputBorder.none))),
          IconButton(icon: const Icon(Icons.send, color: Color(0xFFD4AF37)), onPressed: () {}),
        ],
      ),
    );
  }
}

class MapViewWidget extends StatelessWidget {
  const MapViewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(initialCenter: LatLng(15.3521, 44.2163), initialZoom: 13),
      children: [
        TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
      ],
    );
  }
}
