import 'package:flutter/material.dart';
import 'order_tracking_screen.dart';
import 'add_product_screen.dart';
import 'cart_screen.dart';
import 'wallet_screen.dart';

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
          SliverAppBar(
            expandedHeight: 180,
            backgroundColor: const Color(0xFF1A1A1A),
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeader(),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildSectionTitle("نشاطي التجاري"),
                _buildActionGrid(context),
                const SizedBox(height: 25),
                _buildSectionTitle("خدمات التجار"),
                _buildMerchantCard(context),
                const SizedBox(height: 25),
                _buildSectionTitle("الإعدادات"),
                _buildSettingItem(
                  Icons.dark_mode, 
                  "المظهر الداكن", 
                  trailing: Switch(
                    value: isDarkMode, 
                    activeColor: const Color(0xFFD4AF37),
                    onChanged: (v) => setState(() => isDarkMode = v),
                  ),
                ),
                _buildSettingItem(Icons.help_outline, "الدعم الفني", color: Colors.green),
                _buildSettingItem(Icons.logout, "تسجيل الخروج", color: Colors.redAccent),
                const SizedBox(height: 40),
                Text(
                  "Flex Yemen Ultimate V3.4.0",
                  style: TextStyle(color: isDarkMode ? Colors.white24 : Colors.grey, fontSize: 10),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        const CircleAvatar(radius: 40, backgroundColor: Color(0xFFD4AF37), child: Icon(Icons.person, size: 40, color: Colors.black)),
        const SizedBox(height: 10),
        const Text("عضو فلكس يمن", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(title, style: const TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildActionGrid(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _quickTile(Icons.track_changes, "طلباتي", () => Navigator.push(context, MaterialPageRoute(builder: (c) => const OrderTrackingScreen()))),
        _quickTile(Icons.wallet, "محفظتي", () => Navigator.push(context, MaterialPageRoute(builder: (c) => const WalletScreen()))),
        _quickTile(Icons.shopping_cart, "السلة", () => Navigator.push(context, MaterialPageRoute(builder: (c) => const CartScreen()))),
      ],
    );
  }

  Widget _quickTile(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15)),
            child: Icon(icon, color: const Color(0xFFD4AF37)),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildMerchantCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFD4AF37),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: const Icon(Icons.store, color: Colors.black, size: 30),
        title: const Text("ابدأ بالبيع الآن", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        subtitle: const Text("ارفع منتجاتك للمنصة فوراً", style: TextStyle(color: Colors.black54, fontSize: 11)),
        trailing: const Icon(Icons.add_circle, color: Colors.black),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const AddProductScreen())),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, {Widget? trailing, Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? const Color(0xFFD4AF37)),
      title: Text(title, style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
    );
  }
}
