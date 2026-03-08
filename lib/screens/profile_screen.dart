import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = true; // الحالة الافتراضية للثيم

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            
            // قسم إعدادات التطبيق
            _buildSectionTitle("إعدادات المنصة والتطبيق"),
            _buildSettingTile(Icons.dark_mode, "تبديل المظهر (ثيم)", 
              trailing: Switch(value: isDarkMode, onChanged: (val) => setState(() => isDarkMode = val))),
            
            _buildSettingTile(Icons.language, "لغة التطبيق", subtitle: "العربية (اليمن)"),
            _buildSettingTile(Icons.info_outline, "حول المنصة", subtitle: "فلكس يمن V2.5.0"),
            
            const SizedBox(height: 20),
            
            // قسم الدعم والتواصل
            _buildSectionTitle("الدعم الفني والارتباط"),
            _buildSettingTile(Icons.chat_outlined, "تواصل عبر واتساب", 
              color: Colors.green, 
              onTap: () {
                // منطق فتح واتساب برقم المنصة
                print("Opening WhatsApp Support...");
              }),
            _buildSettingTile(Icons.share, "مشاركة التطبيق", subtitle: "ادعو أصدقاءك وانضم لشركاء فلكس"),
            
            const SizedBox(height: 40),
            Text("جميع الحقوق محفوظة - منصة فلكس يمن 2024", 
              style: TextStyle(color: isDarkMode ? Colors.white24 : Colors.black26, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          const CircleAvatar(radius: 50, backgroundColor: Color(0xFFD4AF37), child: Icon(Icons.person, size: 50, color: Colors.black)),
          const SizedBox(height: 15),
          const Text("مستخدم فلكس المتميز", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Text("صنعاء، اليمن", style: TextStyle(color: Colors.grey[400])),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Align(alignment: Alignment.centerRight, child: Text(title, style: const TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold))),
    );
  }

  Widget _buildSettingTile(IconData icon, String title, {String? subtitle, Widget? trailing, Color? color, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: color ?? const Color(0xFFD4AF37)),
      title: Text(title, style: TextStyle(color: isDarkMode ? Colors.white : Colors.black, fontSize: 14)),
      subtitle: subtitle != null ? Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11)) : null,
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
    );
  }
}
