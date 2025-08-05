// main_drawer.dart
import 'package:appyallavamos/ChantsPage/ChantsPage.dart';
import 'package:appyallavamos/CitiesPage/CitiesPage.dart';
import 'package:appyallavamos/FavTeamPage/FavTeamPage.dart';
import 'package:appyallavamos/FoodPage/FoodPage.dart';
import 'package:appyallavamos/HeritagePage/HeritagePage.dart';
import 'package:appyallavamos/PredictionPage/PredictionPage.dart';
import 'package:appyallavamos/SchedulePage/SchedulePage.dart';
import 'package:appyallavamos/StadiumsStandalonePage/StadiumsStandalonePage.dart';
import 'package:appyallavamos/TransportPage/TransportPage.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff006633), Color(0xffc8102e)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/drawer_header.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "YALA VAMOS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "دليلك للسياحة والكرة في المغرب",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            // القائمة
            _buildItem(context, Icons.stadium, "الملاعب",  StadiumsStandalonePage() ),
            _buildItem(context, Icons.directions_bus, "وسائل النقل", const TransportPage()),
            _buildItem(context, Icons.history_edu, "المعالم التاريخية", const HeritagePage()),
            _buildItem(context, Icons.calendar_month, "توقيت المباريات", const SchedulePage()),

            const Divider(color: Colors.white24),

            _buildItem(context, Icons.location_city, "المدن الكبرى", const CitiesPage()),
            _buildItem(context, Icons.music_note, "  الفرق المعروفة في المغرب", const ChantsPage()),

            const Divider(color: Colors.white24),

            _buildItem(context, Icons.flag, "فريقك المفضل", const FavTeamPage()),
            _buildItem(context, Icons.psychology, "توقع النتيجة", const PredictionPage()),
            _buildItem(context, Icons.restaurant, "أحسن الوجبات في المغرب", const FoodPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {
        Navigator.pop(context); // إغلاق الـ Drawer
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
    );
  }
}

