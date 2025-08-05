// cities_page.dart
import 'package:flutter/material.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> cities = const [
    {
      "name": "الدار البيضاء",
      "desc": "عاصمة الاقتصاد، شاطئ عين دياب ومسجد الحسن الثاني.",
      "image": "images/casa.png",
      "color": Color(0xff006633),
    },
    {
      "name": "الرباط",
      "desc": "العاصمة الإدارية، قصبة الأوداية وضريح محمد الخامس.",
      "image": "images/rabat.png",
      "color": Color(0xffc8102e),
    },
    {
      "name": "مراكش",
      "desc": "المدينة الحمراء، جامع الفنا وحدائق ماجوريل.",
      "image": "images/marrakech.png",
      "color": Colors.orange,
    },
    {
      "name": "طنجة",
      "desc": "بوابة أوروبا، الكهوف الهيرقليون والمدينة القديمة.",
      "image": "images/tanger.png",
      "color": Colors.blueAccent,
    },
    {
      "name": "أكادير",
      "desc": "شاطئ أولان & قلعة أكادير، عاصمة سوس.",
      "image": "images/agadir.png",
      "color": Colors.teal,
    },
    {
      "name": "فاس",
      "desc": "عاصمة الثقافة، فاس البالي والجامعة القرويين.",
      "image": "images/fes.png",
      "color": Colors.brown,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🏙️ المدن الكبرى"),
        centerTitle: true,
        backgroundColor: const Color(0xff006633),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: cities.length,
        itemBuilder: (context, i) {
          final c = cities[i];
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            child: Column(
              children: [
                Image.asset(
                  c["image"],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 180,
                    color: c["color"],
                    child: Icon(Icons.location_city,
                        size: 64, color: Colors.white),
                  ),
                ),
                ListTile(
                  title: Text(
                    c["name"],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: c["color"],
                    ),
                  ),
                  subtitle: Text(
                    c["desc"],
                    style: const TextStyle(fontSize: 14),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // يمكنك الانتقال لصفحة تفاصيل المدينة
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("📍 ${c["name"]} – قريباً"),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}