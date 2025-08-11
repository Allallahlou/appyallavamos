// hotels_discovery_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelsDiscoveryPage extends StatelessWidget {
  const HotelsDiscoveryPage({super.key});

  final List<Map<String, dynamic>> hotels = const [
    {
      "name": "ميدينا جاردنز",
      "city": "مراكش",
      "price": "143 AED",
      "img": "images/hotel1.png",
      "map": "https://maps.apple.com/?q=Medina+Gardens+Marrakech",
    },
    {
      "name": "ريو بالاس تيكيدا",
      "city": "أكادير",
      "price": "995 AED",
      "img": "images/hotel2.png",
      "map": "https://maps.apple.com/?q=Riu+Palace+Agadir",
    },
    {
      "name": "كنزي كلوب أجدال",
      "city": "مراكش",
      "price": "920 AED",
      "img": "images/hotel3.png",
      "map": "https://maps.apple.com/?q=Kenzi+Club+Agdal+Marrakech",
    },
    {
      "name": "رامادا ريزورت",
      "city": "أكادير",
      "price": "190 AED",
      "img": "images/hotel4.png",
      "map": "https://maps.apple.com/?q=Ramada+Resort+Agadir",
    },
  ];

  Future<void> _openMap(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(child: const Text("اكتشف فنادق المغرب")),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // خلفية متدرجة
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff1e3c72), Color(0xff2a5298)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            itemCount: hotels.length,
            itemBuilder: (_, i) {
              final h = hotels[i];
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    color: Colors.white.withOpacity(.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // صورة الفندق
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.asset(h["img"], fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                h["name"],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                h["city"],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    h["price"],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.directions,
                                      color: Colors.amber,
                                      size: 30,
                                    ),
                                    onPressed: () => _openMap(h["map"]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
