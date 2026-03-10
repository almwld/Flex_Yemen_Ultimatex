import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://efbc36e3fdd1428c96d0.supabase.co',
    anonKey: 'efbc36e3-fdd1-428c-a96d-0dd8038fadb1',
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
  int _selectedIndex = 4; // افتراضي على الدردشة
  final List<Widget> _pages = [
    const Center(child: Text("الرئيسية")),
    const Center(child: Text("الخريطة")),
    const Center(child: Text("المتجر")),
    const Center(child: Text("إضافة")),
    const ChatRoomScreen(), // الغرفة الحقيقية
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
        leading: const IconButton(icon: Icon(Icons.arrow_back_ios, color: Color(0xFFD4AF37)), onPressed: null),
        title: Row(
          children: [
            const CircleAvatar(radius: 18, backgroundImage: NetworkImage("https://ui-avatars.com/api/?name=Sana&background=D4AF37&color=000")),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("أبو محمد الصنعاني", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("متصل الآن", style: TextStyle(fontSize: 10, color: Colors.greenAccent)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.phone_outlined, color: Color(0xFFD4AF37)), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: Colors.grey), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // قائمة الرسائل
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                _buildMessage("السلام عليكم، كم السعر النهائي للجنبية؟", false, "10:00 ص"),
                _buildMessage("وعليكم السلام، السعر 45,000 ريال يمني.", true, "10:02 ص"),
                _buildMessage("هل هي صيفاني أصلي؟", false, "10:05 ص"),
                _buildMessage("نعم، صيفاني قديم جداً ومضمون.", true, "10:06 ص"),
              ],
            ),
          ),
          // شريط الإدخال
          _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildMessage(String text, bool isMe, String time) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFFD4AF37).withOpacity(0.2) : const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: Radius.circular(isMe ? 15 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 15),
          ),
          border: Border.all(color: isMe ? const Color(0xFFD4AF37) : Colors.white10, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 5),
            Text(time, style: const TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.right),
          ],
        ),
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        border: Border(top: BorderSide(color: Colors.white10)),
      ),
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.add_circle_outline, color: Color(0xFFD4AF37)), onPressed: () {}),
          IconButton(icon: const Icon(Icons.camera_alt_outlined, color: Colors.grey), onPressed: () {}),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(25)),
              child: const TextField(
                decoration: InputDecoration(hintText: "اكتب رسالتك...", border: InputBorder.none, hintStyle: TextStyle(fontSize: 14)),
              ),
            ),
          ),
          const SizedBox(width: 5),
          CircleAvatar(
            backgroundColor: const Color(0xFFD4AF37),
            child: const IconButton(icon: Icon(Icons.send_rounded, color: Colors.black), onPressed: null),
          ),
        ],
      ),
    );
  }
}
