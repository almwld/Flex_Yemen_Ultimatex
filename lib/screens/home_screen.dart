import 'dart:async';
import 'package:flutter/material.dart';
import '../core/constants.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> _sliderItems = [
    {'title': 'عروض العقارات الحصرية', 'sub': 'أراضي في أرقى أحياء صنعاء', 'image': 'https://img.freepik.com/free-photo/modern-residential-district-with-luxury-houses_23-2148967912.jpg', 'price': 'تفاوض'},
    {'title': 'تنزيلات الأسواق الأسبوعية', 'sub': 'خصومات تصل إلى 50%', 'image': 'https://img.freepik.com/free-photo/shopping-concept-cart-with-bags_23-2148161559.jpg', 'price': 'عروض'},
    {'title': 'مزاد الجنابي الكبرى', 'sub': 'أقوى مزادات الموسم', 'image': 'https://img.freepik.com/premium-photo/traditional-yemeni-jambiya-dagger-dagger-is-decorative-with-intricate-patterns_713651-124.jpg', 'price': 'مزاد'},
    {'title': 'سوق السيارات الحديثة', 'sub': 'أحدث الموديلات بأسعار منافسة', 'image': 'https://img.freepik.com/free-photo/front-view-generic-brandless-suv-car_1101-2098.jpg', 'price': '35,000 \$'},
    {'title': 'قسم النوادر والتحف', 'sub': 'قطع أثرية أصلية ونادرة', 'image': 'https://img.freepik.com/free-photo/antique-gold-clock_23-2147983617.jpg', 'price': 'نادر'},
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(_currentPage, duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0,
        title: const Text("FLEX YEMEN", style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _sliderItems.length,
                onPageChanged: (int page) => setState(() => _currentPage = page),
                itemBuilder: (context, index) => _buildSliderCard(_sliderItems[index]),
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(title: item['title']!, price: item['price']!, image: item['image']!)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: NetworkImage(item['image']!), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [Colors.black.withOpacity(0.8), Colors.transparent])),
          padding: const EdgeInsets.all(15),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(item['title']!, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Text(item['sub']!, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ]),
        ),
      ),
    );
  }

  Widget _buildSearchBar() => Padding(padding: const EdgeInsets.all(15), child: Container(height: 50, decoration: BoxDecoration(color: AppColors.darkGrey, borderRadius: BorderRadius.circular(10)), child: const Center(child: Text("ابحث في فلكس يمن...", style: TextStyle(color: Colors.grey)))));
  Widget _buildDotsIndicator() => Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(_sliderItems.length, (index) => Container(width: 8, height: 8, margin: const EdgeInsets.all(4), decoration: BoxDecoration(shape: BoxShape.circle, color: _currentPage == index ? AppColors.gold : Colors.grey))));
  Widget _buildSectionHeader(String t) => Padding(padding: const EdgeInsets.all(15), child: Text(t, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
  Widget _buildCategoryGrid() => Container(height: 100, color: AppColors.darkGrey, margin: const EdgeInsets.all(15), child: const Center(child: Text("شبكة الأقسام")));
}
