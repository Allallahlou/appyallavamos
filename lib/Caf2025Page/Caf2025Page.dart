// caf2025_page.dart
import 'package:flutter/material.dart';

class Caf2025Page extends StatelessWidget {
  const Caf2025Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("كأس إفريقيا 2025"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // خلفية متدرّجة
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff006633), Color(0xffc8102e)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 100,
              left: 20,
              right: 20,
              bottom: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // شعار البطولة
                Image.asset(
                  'images/2025_Africa_Cup_of_Nations_logo.png',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                const SizedBox(height: 20),
                const Text(
                  "المغرب 2025",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "21 ديسمبر – 18 يناير",
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
                const SizedBox(height: 30),
                // بطاقة معلومات سريعة
                _buildInfoCard("🗓️ عدد المباريات", "52 مباراة"),
                const SizedBox(height: 12),
                _buildInfoCard("🏟️ عدد الملاعب", "9 ملاعب"),
                const SizedBox(height: 12),
                _buildInfoCard("🌍 المنتخبات", "24 منتخبًا"),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfffcd116),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.calendar_today),
                  label: const Text("احجز مقعدك الآن"),
                  onPressed: () {
                    // TODO: افتح بوابة التذاكر
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
