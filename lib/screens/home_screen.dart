import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider; // اللقب لمنع التضارب
import '../core/constants.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSlide = 0;
  // نستخدم slider.CarouselController هنا
  final slider.CarouselController _controller = slider.CarouselController();

  final List<Map<String, String>> _sliderItems = [
    {
      'title': 'عروض العقارات الحصرية',
      'sub': 'فلل وأراضي في أرقى أحياء صنعاء',
      'image': 'https://img.freepik.com/free-photo/modern-residential-district-with-luxury-houses_23-2148967912.jpg',
      'price': 'تفاوض'
    },
    {
      'title': 'تنزيلات الأسواق الأسبوعية',
      'sub': 'خصومات تصل إلى 50% على الإلكترونيات',
      'image': 'https://img.freepik.com/free-photo/shopping-concept-cart-with-bags_23-2148161559.jpg',
      'price': 'عروض'
    },
    {
      'title': 'مزاد الجنابي الكبرى',
      'sub': 'اشترك الآن في أقوى مزادات الموسم',
      'image': 'https://img.freepik.com/premium-photo/traditional-yemeni-jambiya-dagger-dagger-is-decorative-with-intricate-patterns_713651-124.jpg',
      'price': 'مزاد'
    },
    {
      'title': 'سوق السيارات الحديثة',
      'sub': 'أحدث الموديلات بأسعار منافسة',
      'image': 'https://img.freepik.com/free-photo/front-view-generic-brandless-suv-car_1101-2098.jpg',
      'price': '35,000 \$'
    },
    {
      'title': 'قسم النوادر والتحف',
      'sub': 'قطع أثرية أصلية ونادرة',
      'image': 'https://img.freepik.com/free-photo/antique-gold-clock_23-2147983617.jpg',
      'price': 'نادر'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.settings_outlined, color: AppColors.gold),
        title: const Text("FLEX YEMEN", style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            // نستخدم slider.CarouselSlider و slider.CarouselOptions
            slider.CarouselSlider(
              items: _sliderItems.map((item) => _buildSliderCard(item)).toList(),
              carouselController: _controller,
              options: slider.CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) => setState(() => _currentSlide = index),
              ),
            ),
            _buildDotsIndicator(),
            const SizedBox(height: 20),
            _buildSectionHeader("🏠 العقارات والاستثمارات"),
            _buildCategoryGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderCard(Map<String, String> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              title: item['title']!,
              price: item['price']!, 
              image: item['image']!,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: NetworkImage(item['image']!), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.8), Colors.transparent],
            ),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item['title']!, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              Text(item['sub']!, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() => Padding(padding: const EdgeInsets.all(15), child: Container(height: 50, decoration: BoxDecoration(color: AppColors.darkGrey, borderRadius: BorderRadius.circular(10)), child: const Center(child: Text("ابحث في فلكس يمن...", style: TextStyle(color: Colors.grey)))));
  Widget _buildDotsIndicator() => Row(mainAxisAlignment: MainAxisAlignment.center, children: _sliderItems.asMap().entries.map((e) => Container(width: 8, height: 8, margin: const EdgeInsets.all(4), decoration: BoxDecoration(shape: BoxShape.circle, color: _currentSlide == e.key ? AppColors.gold : Colors.grey))).toList());
  Widget _buildSectionHeader(String t) => Padding(padding: const EdgeInsets.all(15), child: Text(t, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
  Widget _buildCategoryGrid() => Container(height: 100, color: AppColors.darkGrey, margin: const EdgeInsets.all(15), child: const Center(child: Text("شبكة الأقسام")));
}
