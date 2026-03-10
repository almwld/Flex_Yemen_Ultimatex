import 'package:flutter/material.dart';
import '../core/constants.dart';

class PostAdScreen extends StatefulWidget {
  const PostAdScreen({super.key});

  @override
  State<PostAdScreen> createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  String _selectedCategory = 'سيارات ومحركات';
  final List<String> _categories = ['سيارات ومحركات', 'عقارات وأراضي', 'إلكترونيات', 'مزادات متنوعة'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة إعلان جديد", style: TextStyle(color: AppColors.gold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قسم رفع الصور
            const Text("صور الإعلان", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildAddPhotoBox(),
                const SizedBox(width: 10),
                _buildAddPhotoBox(isEmpty: true),
              ],
            ),
            
            const SizedBox(height: 25),
            
            // اختيار القسم
            const Text("اختر القسم المناسب", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCategory,
                  isExpanded: true,
                  dropdownColor: AppColors.darkGrey,
                  items: _categories.map((String value) {
                    return DropdownMenuItem<String>(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (newValue) => setState(() => _selectedCategory = newValue!),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // تفاصيل الإعلان
            _buildTextField("عنوان الإعلان", "مثال: شاص 2024 بازرعة"),
            _buildTextField("السعر", "بالريال اليمني أو الدولار", isNumber: true),
            _buildTextField("الوصف", "اكتب مواصفات المنتج بالتفصيل...", isLong: true),

            const SizedBox(height: 30),

            // زر النشر الملكي
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text("نشر الإعلان الآن", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 100), // مساحة للشريط السفلي
          ],
        ),
      ),
    );
  }

  Widget _buildAddPhotoBox({bool isEmpty = false}) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.gold.withOpacity(0.5), style: BorderStyle.solid),
      ),
      child: Icon(isEmpty ? Icons.add_a_photo_outlined : Icons.camera_alt, color: AppColors.gold),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isNumber = false, bool isLong = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          TextField(
            maxLines: isLong ? 4 : 1,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
              filled: true,
              fillColor: AppColors.darkGrey,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}
