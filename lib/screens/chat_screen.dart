import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("مركز المراسلة", style: TextStyle(color: Color(0xFFD4AF37))),
        backgroundColor: Colors.black,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFD4AF37),
          labelColor: const Color(0xFFD4AF37),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "المساعد الآلي", icon: Icon(Icons.smart_toy_outlined)),
            Tab(text: "الدعم الفني", icon: Icon(Icons.support_agent)),
            Tab(text: "التجار والعملاء", icon: Icon(Icons.groups_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildChatList("بوت فلكس الذكي", "كيف يمكنني مساعدتك اليوم؟"),
          _buildChatList("دعم Flex Market", "تم استلام طلبك رقم #12"),
          _buildChatList("الدردشات التجارية", "متوفر لدينا الآن..."),
        ],
      ),
    );
  }

  Widget _buildChatList(String title, String lastMsg) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, i) => ListTile(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdvancedChatPage())),
        leading: CircleAvatar(backgroundColor: const Color(0xFF1A1A1A), child: Icon(Icons.person, color: Colors.grey[700])),
        title: Text("$title ${i+1}", style: const TextStyle(color: Colors.white, fontSize: 14)),
        subtitle: Text(lastMsg, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        trailing: const Text("١٠:٠٠ ص", style: TextStyle(color: Colors.white10, fontSize: 10)),
      ),
    );
  }
}

class AdvancedChatPage extends StatelessWidget {
  const AdvancedChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: const Color(0xFF1A1A1A), title: const Text("محادثة نشطة")),
      body: Column(
        children: [
          Expanded(child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              _chatBubble("أهلاً بك في Flex Market", false, context),
              _chatBubble("أريد إرسال صورة المنتج", true, context),
              _imageBubble(true), // عرض صورة مرفوعة
            ],
          )),
          _buildChatInput(),
        ],
      ),
    );
  }

  Widget _chatBubble(String msg, bool isMe, BuildContext context) {
    return GestureDetector(
      onLongPress: () => _showReactions(context), // ميزة الإعجاب مثل واتساب
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isMe ? const Color(0xFFD4AF37) : const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(msg, style: TextStyle(color: isMe ? Colors.black : Colors.white)),
              if (isMe) const Icon(Icons.done_all, size: 12, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageBubble(bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 200, height: 150,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFD4AF37), width: 0.5)
        ),
        child: const Icon(Icons.image, color: Colors.white24, size: 50),
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color(0xFF151515),
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.camera_alt_outlined, color: Color(0xFFD4AF37)), onPressed: () {}), // رفع صور
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "اكتب رسالتك...",
                filled: true, fillColor: Colors.black,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
              ),
            ),
          ),
          IconButton(icon: const Icon(Icons.send, color: Color(0xFFD4AF37)), onPressed: () {}),
        ],
      ),
    );
  }

  void _showReactions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(30)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("❤️", style: TextStyle(fontSize: 25)),
            Text("👍", style: TextStyle(fontSize: 25)),
            Text("😂", style: TextStyle(fontSize: 25)),
            Text("😮", style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
