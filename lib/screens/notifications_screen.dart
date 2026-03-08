import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {'title': 'عرض جديد في صنعاء', 'body': 'تخفيضات ٥٠٪ في مول العرب لفترة محدودة!', 'time': 'منذ دقيقتين', 'type': 'offer'},
      {'title': 'تحديث في المحفظة', 'body': 'تم إضافة ٥٠٠ نقطة ترحيبية لحسابك بنجاح.', 'time': 'منذ ساعة', 'type': 'wallet'},
      {'title': 'إشعار إداري', 'body': 'أهلاً بك في نسخة فلكس يمن V2.3.0 الجديدة.', 'time': 'منذ يوم', 'type': 'info'},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("الإشعارات والتنبيهات", style: TextStyle(color: Color(0xFFD4AF37))),
        backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, i) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white10),
          ),
          child: ListTile(
            leading: _buildIcon(notifications[i]['type']),
            title: Text(notifications[i]['title'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(notifications[i]['body'], style: const TextStyle(color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 5),
                Text(notifications[i]['time'], style: const TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String type) {
    IconData icon;
    Color color;
    if (type == 'offer') { icon = Icons.local_offer; color = Colors.red; }
    else if (type == 'wallet') { icon = Icons.account_balance_wallet; color = Colors.green; }
    else { icon = Icons.info_outline; color = Colors.blue; }
    
    return CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color, size: 20));
  }
}
