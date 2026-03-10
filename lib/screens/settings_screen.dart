import 'package:flutter/material.dart';
import '../core/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الإعدادات", style: TextStyle(color: AppColors.gold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.gold),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          _buildSectionTitle("الحساب والأمان"),
          _buildSettingTile(Icons.person_outline, "تعديل الملف الشخصي", "تغيير الاسم، الصورة، والرقم"),
          _buildSettingTile(Icons.verified_user_outlined, "توثيق الحساب (KYC)", "ارفع هويتك لتصبح تاجراً موثوقاً"),
          _buildSettingTile(Icons.lock_outline, "تغيير كلمة المرور", "تأمين حسابك بشكل دوري"),
          
          const SizedBox(height: 20),
          _buildSectionTitle("التفضيلات"),
          _buildSettingTile(Icons.notifications_active_outlined, "التنبيهات", "التحكم في إشعارات المزايدات والرسائل"),
          _buildSettingTile(Icons.language_outlined, "اللغة / Language", "العربية (اليمن)"),
          _buildSettingTile(Icons.dark_mode_outlined, "المظهر", "الوضع الملكي (داكن)"),

          const SizedBox(height: 20),
          _buildSectionTitle("الدعم والمساعدة"),
          _buildSettingTile(Icons.help_outline, "مركز المساعدة", "الأسئلة الشائعة وكيفية الاستخدام"),
          _buildSettingTile(Icons.info_outline, "عن فلكس يمن", "الإصدار v1.0.0"),
          
          const SizedBox(height: 40),
          // زر خروج مميز
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Colors.redAccent),
            title: const Text("تسجيل الخروج", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
            onTap: () {
              // منطق الخروج هنا
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
    );
  }

  Widget _buildSettingTile(IconData icon, String title, String sub) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white10),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.gold, size: 22),
        title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        subtitle: Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 14),
        onTap: () {},
      ),
    );
  }
}
