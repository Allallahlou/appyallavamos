// transport_page.dart
import 'package:appyallavamos/CityTransportPage/CityTransportPage.dart';
import 'package:appyallavamos/api_service/api_service.dart';
import 'package:flutter/material.dart';

class TransportPage extends StatefulWidget {
  const TransportPage({Key? key}) : super(key: key);

  @override
  State<TransportPage> createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  late Future<List<String>> futureCities;

  @override
  void initState() {
    super.initState();
    futureCities = ApiService.getCities();
  }

  // 🎨 لوحة الألوان المغربية
  final Color _primary = const Color(0xff006633);
  final Color _accent = const Color(0xffFFD700);
  final Color _surface = const Color(0xfff5f5f5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "🏆 مدن كأس إفريقيا",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: _primary,
          ),
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: futureCities,
        builder: (_, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: _primary, strokeWidth: 3),
            );
          }
          if (snap.hasError) {
            return Center(
              child: Text(
                "⚠ خطأ: ${snap.error}",
                style: TextStyle(color: Colors.red.shade700),
              ),
            );
          }
          final cities = snap.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: cities.length,
              itemBuilder: (_, i) {
                final city = cities[i];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) =>
                          CityTransportPage(city: city),
                      transitionsBuilder: (_, anim, __, child) =>
                          FadeTransition(opacity: anim, child: child),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _surface,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(.8),
                          offset: const Offset(-6, -6),
                          blurRadius: 12,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          offset: const Offset(6, 6),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_city, size: 42, color: _primary),
                        const SizedBox(height: 8),
                        Text(
                          city,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: _primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: _accent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
