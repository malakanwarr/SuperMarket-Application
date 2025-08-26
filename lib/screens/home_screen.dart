import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supermarket_app/screens/product_list_screen.dart';
import 'package:supermarket_app/screens/search_results_screen.dart';



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> categories = [
    {'name': 'Discounts', 'image': '/Users/malakamr/supermarket_app/lib/assets/discount.png'},
    {'name': 'Fruits', 'image': '/Users/malakamr/supermarket_app/lib/assets/fruits.png'},
    {'name': 'Vegetables', 'image': '/Users/malakamr/supermarket_app/lib/assets/vegetables.png'},
    {'name': 'Dairy', 'image': '/Users/malakamr/supermarket_app/lib/assets/diary.png'},
    {'name': 'Bakery', 'image': '/Users/malakamr/supermarket_app/lib/assets/bakery.png'},
    {'name': 'Beverages', 'image': '/Users/malakamr/supermarket_app/lib/assets/beverages.png'},
  ];
  final List<String> promoImages = [
  '/Users/malakamr/supermarket_app/lib/assets/promo2.png',
  '/Users/malakamr/supermarket_app/lib/assets/promo1.png',
];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
  backgroundColor: Colors.white,
  centerTitle: false, // disable center title
  title: Container(
    width: double.infinity, // full width
    child: Image.asset(
      '/Users/malakamr/supermarket_app/lib/assets/logo.png', // Make sure the image exists here
      width: 100, // adjust width as needed
      height: 80, // adjust height as needed
      fit: BoxFit.contain, // maintain aspect ratio
      alignment: Alignment.centerRight, // align image to the left
    ),
  ),
),


     body: Padding(
  padding: const EdgeInsets.all(12.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 👇 LOCATION ROW
      Row(
        children: const [
          Icon(Icons.location_on, color: Colors.green),
          SizedBox(width: 8),
          Text(
            "Delivering to: Nasr City",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      const SizedBox(height: 20), // spacing between location and grid
      TextField(
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.search),
    hintText: "Search products",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.grey[200],
  ),
  onSubmitted: (query) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchResultsScreen(query: query),
      ),
    );
  },
),


    SizedBox(height: 20),
    //BANNER 
   HomeBanner(promoImages: promoImages),



SizedBox(height: 20),
      Text(
        "Categories",
        style: TextStyle(
          fontSize: 20,
          color: const Color.fromARGB(255, 25, 71, 28),
          fontFamily: 'Schyler',
        ),
      ),
      SizedBox(height: 10),

      // 👇 EXPAND the GridView so it takes the remaining height
      Expanded(
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: categories.map((category) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductListScreen(category: category['name']!),
                  ),
                );
              },
              child: Card(
  elevation: 3, // subtle shadow
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  color: const Color.fromARGB(255, 237, 244, 232),
  child: InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductListScreen(category: category['name']!),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category['image']!,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          Text(
            category['name']!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.green.shade800,
            ),
          ),
        ],
      ),
    ),
  ),
),

            );
          }).toList(),
        ),
      ),
    ],
  ),
),

    );
  }
}

class HomeBanner extends StatefulWidget {
  final List<String> promoImages;

  const HomeBanner({required this.promoImages, super.key});

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  late final PageController _pageController;
  late final Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!mounted) return;
      setState(() {
        _currentPage = (_currentPage + 1) % widget.promoImages.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      });
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
    return SizedBox(
      height: 200,
      child: PageView(
        controller: _pageController,
        children: widget.promoImages.map((imagePath) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
