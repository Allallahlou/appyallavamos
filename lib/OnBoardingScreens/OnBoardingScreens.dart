import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:appyallavamos/Caf2025Page/Caf2025Page.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens>
    with TickerProviderStateMixin {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "title": "🏆 كأس إفريقيا 2025",
      "body": "انطلاقة جديدة في قلب المغرب، حيث تلتقي الأحلام بالواقع.",
      "image": "images/onboard1.png",
    },
    {
      "title": "⚽ تنافس من أجل المجد",
      "body": "24 منتخباً، 52 مباراة، وأنت في قلب الحدث.",
      "image": "images/onboard2.png",
    },
    {
      "title": "🌍 شارك بالتاريخ",
      "body": "تابع، شجع، وكن جزءاً من قارة الألقاب.",
      "image": "images/onboard3.png",
    },
  ];

  void _goToApp() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const Caf2025Page(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutQuart;
          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 700),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  double value = 1.0;
                  if (_controller.position.haveDimensions) {
                    value = _controller.page! - index;
                    value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
                  }
                  return Transform.scale(
                    scale: Curves.easeOut.transform(value),
                    child: child,
                  );
                },
                child: _buildPage(
                  _pages[index]["title"]!,
                  _pages[index]["body"]!,
                  _pages[index]["image"]!,
                ),
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: _pages.length,
                effect: const WormEffect(
                  activeDotColor: Colors.amberAccent,
                  dotColor: Colors.white30,
                  dotHeight: 12,
                  dotWidth: 12,
                ),
              ),
            ),
          ),
          if (_currentPage == _pages.length - 1)
            Positioned(
              bottom: 30,
              right: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: _goToApp,
                child: const Text(
                  "ابدأ الآن",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPage(String title, String body, String image) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 220),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            body,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(.8)),
          ),
        ],
      ),
    );
  }
}
