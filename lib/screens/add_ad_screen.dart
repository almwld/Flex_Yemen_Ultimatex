import 'package:flutter/material.dart';

class AddAdScreen extends StatelessWidget {
  const AddAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("إضافة إعلان جديد", style: TextStyle(color: Color(0xFFD4AF37))),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قسم رفع الصور
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFD4AF37), style: BorderStyle.solid),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo_outlined, color: Color(0xFFD4AF37), size: 40),
                  SizedBox(height: 10),
                  Text("اضغط لإضافة صور المنتج", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 25),
            
            // حقول البيانات
            _buildTextField("عنوان الإعلان", "مثال: لاندكروزر 2024 نظيف جداً"),
            _buildTextField("السعر (ر.ي / $)", "حدد السعر المتوقع", isNumber: true),
            _buildTextField("الوصف", "اكتب مواصفات المنتج بالتفصيل...", isLong: true),
            
            const SizedBox(height: 20),
            
            // اختيار الموقع (الارتباط مع الخريطة)
            ListTile(
              leading: const Icon(Icons.location_on, color: Color(0xFFD4AF37)),
              title: const Text("تحديد الموقع على الخريطة", style: TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              tileColor: Colors.white.withOpacity(0.05),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onTap: () {
                // الانتقال لشاشة الخريطة لتحديد الموقع
              },
            ),
            
            const SizedBox(height: 30),
            
            // زر النشر الأسطوري
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text("نشر الإعلان الآن", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isNumber = false, bool isLong = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            maxLines: isLong ? 4 : 1,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white24, fontSize: 14),
              filled: true,
              fillColor: Colors.white.withOpacity(0.05),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}
