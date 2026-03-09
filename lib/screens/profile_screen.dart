import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(height: 40),
          Center(
            child: Column(
              children: [
                CircleAvatar(radius: 50, backgroundColor: Color(0xFFD4AF37), child: Icon(Icons.person, size: 50, color: Colors.black)),
                SizedBox(height: 15),
                Text("المستخدم المتميز", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                Text("user@flexyemen.com", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          SizedBox(height: 30),
          _profileItem(Icons.settings, "إعدادات الحساب"),
          _profileItem(Icons.favorite, "المفضلة"),
          _profileItem(Icons.location_on, "عناويني"),
          _profileItem(Icons.help, "مركز المساعدة"),
          _profileItem(Icons.logout, "تسجيل الخروج", color: Colors.red),
        ],
      ),
    );
  }

  Widget _profileItem(IconData icon, String title, {Color color = Colors.white}) {
    return ListTile(
      leading: Icon(icon, color: color == Colors.red ? Colors.red : Color(0xFFD4AF37)),
      title: Text(title, style: TextStyle(color: color)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white12, size: 16),
    );
  }
}
