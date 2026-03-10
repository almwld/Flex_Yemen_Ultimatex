import 'dart:async';
import 'package:flutter/material.dart';
import '../core/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  final List<Map<String, String>> _sliderItems = [
    {'title': 'عروض العقارات الحصرية', 'sub': 'فلل وأراضي في أرقى أحياء صنعاء', 'color': '0xFF1E3A8A'},
    {'title': 'تنزيلات الأسواق', 'icon': '🛍️', 'sub': 'خصومات تصل إلى 40% على الإلكترونيات', 'color': '0xFFB8860B'},
    {'title': 'مزاد الجنابي الكبرى', 'sub': 'اشترك الآن في أقوى مزادات الموسم', 'color': '0xFF7F1D1D'},
    {'title': 'سوق السيارات الحديثة', 'sub': 'أحدث الموديلات بأسعار منافسة', 'color': '0xFF14532D'},
    {'title': 'قسم النوادر والتحف', 'sub': 'قطع أثرية وجنابي صيفاني أصلية', 'color': '0xFF4C1D95'},
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
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutSine,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.settings_outlined, color: AppColors.gold),
        title: const Text("FLEX YEMEN", style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        centerTitle: true,
        actions: [
          const Icon(Icons.shopping_bag_outlined, color: AppColors.gold),
          const SizedBox(width: 15),
          const Icon(Icons.wb_sunny_outlined, color: AppColors.gold),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. شريط البحث
            _buildSearchBar(),

            // 2. السلايدر المتحرك (5 سلايدر)
            SizedBox(
              height: 160,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) => setState(() => _currentPage = page),
                itemCount: _sliderItems.length,
                itemBuilder: (context, index) {
                  return _buildSliderCard(_sliderItems[index]);
                },
              ),
            ),
            
            // مؤشر السلايدر (Dots)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_sliderItems.length, (index) => _buildDot(index)),
            ),

            const SizedBox(height: 20),

            // 3. الأقسام (العقارات) كما في طلبك السابق
            _buildSectionHeader("🏠 العقارات والاستثمارات"),
            _buildCategoryGrid([
              {'title': 'أراضي استثمارية', 'icon': Icons.stars, 'color': Colors.blue},
              {'title': 'فلل للبيع', 'icon': Icons.stars, 'color': Colors.blue},
              {'title': 'شقق للإيجار', 'icon': Icons.stars, 'color': Colors.blue},
            ]),

            _buildSectionHeader("🔥 المزادات الحية"),
            _buildAuctionGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(color: AppColors.darkGrey, borderRadius: BorderRadius.circular(10)),
        child: const TextField(
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: "ابحث عن عقارات، سيارات، مزادات...",
            prefixIcon: Icon(Icons.search, color: AppColors.gold),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildSliderCard(Map<String, String> item) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(int.parse(item['color']!)),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(item['title']!, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(item['sub']!, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13)),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(10)),
            child: const Text("تصفح الآن", style: TextStyle(color: Colors.white, fontSize: 10)),
          )
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? AppColors.gold : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("عرض الكل", style: TextStyle(color: AppColors.gold, fontSize: 12)),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid(List<Map<String, dynamic>> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.1),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(color: AppColors.darkGrey, borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.white10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(items[index]['icon'], color: items[index]['color'], size: 25),
              const SizedBox(height: 8),
              Text(items[index]['title'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAuctionGrid() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: _buildSmallAuctionCard("شاص 2024", "35k \$")),
          const SizedBox(width: 10),
          Expanded(child: _buildSmallAuctionCard("جنبية صيفاني", "5k \$")),
        ],
      ),
    );
  }

  Widget _buildSmallAuctionCard(String t, String p) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: AppColors.darkGrey, borderRadius: BorderRadius.circular(15)),
      child: Column(children: [Text(t), Text(p, style: const TextStyle(color: AppColors.gold))]),
    );
  }
}
