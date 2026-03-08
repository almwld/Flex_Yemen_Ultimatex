import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String selectedCategory = 'مطاعم';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("رفع منتج جديد", style: TextStyle(color: Color(0xFFD4AF37))),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. منطقة رفع الصور
              _buildImagePickerSection(),
              
              const SizedBox(height: 25),
              
              // 2. تفاصيل المنتج
              _buildTextField("اسم المنتج / الإعلان", Icons.edit),
              _buildTextField("السعر (ر.ي)", Icons.payments_outlined, isNumber: true),
              
              const SizedBox(height: 15),
              
              // 3. اختيار القسم
              const Text("اختر القسم المناسب:", style: TextStyle(color: Colors.white70, fontSize: 12)),
              _buildCategoryDropdown(),
              
              const SizedBox(height: 15),
              
              _buildTextField("وصف المنتج بالتفصيل...", Icons.description, maxLines: 4),
              
              const SizedBox(height: 30),
              
              // 4. زر الرفع النهائي
              _buildUploadButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePickerSection() {
    return Row(
      children: [
        _imageSourceCard(Icons.camera_alt, "كاميرا", () {
            print("Opening Camera..."); // سيتم ربطها بـ image_picker لاحقاً
        }),
        const SizedBox(width: 15),
        _imageSourceCard(Icons.photo_library, "المعرض", () {
            print("Opening Gallery...");
        }),
      ],
    );
  }

  Widget _imageSourceCard(IconData icon, String label, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.3)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: const Color(0xFFD4AF37), size: 30),
              const SizedBox(height: 5),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, {bool isNumber = false, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          prefixIcon: Icon(icon, color: const Color(0xFFD4AF37), size: 20),
          filled: true,
          fillColor: const Color(0xFF1A1A1A),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15)),
      child: DropdownButton<String>(
        value: selectedCategory,
        isExpanded: true,
        dropdownColor: const Color(0xFF1A1A1A),
        underline: Container(),
        items: ['مطاعم', 'سوبر ماركت', 'ملبوسات', 'إلكترونيات', 'سيارات', 'عقارات'].map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value, style: const TextStyle(color: Colors.white)));
        }).toList(),
        onChanged: (val) => setState(() => selectedCategory = val!),
      ),
    );
  }

  Widget _buildUploadButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("جاري معالجة المنتج ورفعه للمنصة...")));
        },
        icon: const Icon(Icons.cloud_upload_outlined, color: Colors.black),
        label: const Text("نشر المنتج الآن", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
