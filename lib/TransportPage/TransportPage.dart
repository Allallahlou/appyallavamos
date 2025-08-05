// transport_page.dart
import 'package:flutter/material.dart';

class TransportPage extends StatelessWidget {
  const TransportPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> transports = const [
    {
      "type": "TGV",
      "title": "القطار فائق السرعة",
      "desc":
          "يربط طنجة – الرباط – الدار البيضاء خلال أقل من ساعتين.\nحجز إلكتروني عبر تطبيق ONCF.",
      "icon": Icons.train,
      "color": Colors.blueAccent,
    },
    {
      "type": "ONCF",
      "title": "القطارات التقليدية",
      "desc":
          "شبكة واسعة تغطي معظم المدن (ما عدا أكادير والناظور).\nتطبيق ONCF Mobile للحجز والتتبع.",
      "icon": Icons.directions_railway,
      "color": Colors.green,
    },
    {
      "type": "CTM",
      "title": "حافلات CTM",
      "desc":
          "أسطول حديث مع تكييف وواي فاي.\nحجز إلكتروني عبر تطبيق CTM Mobile.",
      "icon": Icons.directions_bus,
      "color": Colors.amber,
    },
    {
      "type": "Supratours",
      "title": "حافلات Supratours",
      "desc":
          "تغطية شاملة مقارنة مع القطار.\nحجز مباشر عبر الموقع أو المحطات.",
      "icon": Icons.airport_shuttle,
      "color": Colors.orange,
    },
    {
      "type": "Tramway",
      "title": "الترامواي",
      "desc":
          "الرباط-سلا والدار البيضاء.\nتذكرة إلكترونية أو بطاقة التنقل.",
      "icon": Icons.tram,
      "color": Colors.red,
    },
    {
      "type": "Taxi",
      "title": "التاكسي الأخضر / الكبير",
      "desc":
          "تاكسي صغير داخل المدن، وكبير بين المدن.\nأسعار ثابتة أو تفاوضية.",
      "icon": Icons.local_taxi,
      "color": Colors.teal,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🚌 وسائل النقل"),
        centerTitle: true,
        backgroundColor: const Color(0xff006633),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: transports.length,
        itemBuilder: (context, i) {
          final t = transports[i];
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: t["color"],
                child: Icon(t["icon"], color: Colors.white),
              ),
              title: Text(
                t["title"],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                t["desc"],
                style: const TextStyle(fontSize: 13),
              ),
              contentPadding: const EdgeInsets.all(12),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("💡 معلومات عن ${t["type"]} – قريباً"),
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