import 'package:flutter/material.dart';
import 'order_tracking_screen.dart';
import 'add_product_screen.dart';
import 'cart_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          // رأس الصفحة الاحترافي
          SliverAppBar(
            expandedHeight: 200,
            backgroundColor: const Color(0xFF1A1A1A),
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeader(context),
            ),
          ),
          
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              
              // قسم "نشاطي المالي والتجاري"
              _buildSectionTitle("نشاطي"),
              _buildActionGrid(context),
              
              const SizedBox(height: 25),
              
              // قسم "أدوات التاجر"
              _buildSectionTitle("مركز التجار"),
              _buildMerchantCard(context),
              
              const SizedBox(height: 25),
              
              // قسم "الإعدادات والدعم"
              _buildSectionTitle("الإعدادات والنظام"),
              _buildSettingItem(Icons.dark_mode, "وضع المظهر (Dark Mode)", 
                  trailing: Switch(value: isDarkMode, activeColor: const Color(0xFFD4AF37), onChanged: (val) => setState(() => isDarkMode = val))),
              _buildSettingItem(Icons.language, "لغة التطبيق", subtitle: "العربية (اليمن)"),
              _buildSettingItem(Icons.help_outline, "مركز المساعدة (واتساب)", color: Colors.green, onTap: () {}),
              _buildSettingItem(Icons.info_outline, "حول فلكس يمن", subtitle: "الإصدار V3.0.0"),
              _buildSettingItem(Icons.logout, "تسجيل الخروج", color: Colors.redAccent, onTap: () {}),
              
              const SizedBox(height: 50),
              Center(child: Text("Flex Yemen © 2024", style: TextStyle(color: Colors.grey[600], fontSize: 10))),
              const SizedBox(height: 20),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          const CircleAvatar(radius: 45, backgroundColor: Color(0xFFD4AF37), child: Icon(Icons.person, size: 50, color: Colors.black)),
          const SizedBox(height: 10),
          const Text("مستخدم فلكس المتميز", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: Color(0xFFD4AF37), size: 14),
              Text(" صنعاء - حي حدة", style: TextStyle(color: Colors.grey[400], fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(title, style: const TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _buildActionGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _quickTile(context, Icons.track_changes, "تتبع طلباتي", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderTrackingScreen()))),
          _quickTile(context, Icons.account_balance_wallet_outlined, "محفظتي", () {}),
          _quickTile(context, Icons.shopping_cart_outlined, "السلة", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()))),
          _quickTile(context, Icons.favorite_border, "المفضلة", () {}),
        ],
      ),
    );
  }

  Widget _quickTile(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15)),
            child: Icon(icon, color: const Color(0xFFD4AF37)),
          ),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black87, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildMerchantCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFD4AF37), Color(0xFFB8860B)]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.storefront, size: 40, color: Colors.black),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ابدأ البيع الآن", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                Text("ارفع منتجاتك ووسع تجارتك في اليمن", style: TextStyle(color: Colors.black54, fontSize: 11)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddProductScreen())),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: const Text("رفع منتج", style: TextStyle(color: Color(0xFFD4AF37))),
          )
        ],
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, {String? subtitle, Widget? trailing, Color? color, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: color ?? const Color(0xFFD4AF37)),
      title: Text(title, style: TextStyle(color: isDarkMode ? Colors.white : Colors.black, fontSize: 14)),
      subtitle: subtitle != null ? Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11)) : null,
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
    );
  }
}
