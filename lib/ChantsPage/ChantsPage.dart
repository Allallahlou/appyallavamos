// teams_titles_page.dart
import 'package:flutter/material.dart';

class TeamsTitlesPage extends StatelessWidget {
  const TeamsTitlesPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> teams = const [
    {
      "name": "الوداد البيضاوي",
      "logo": "images/wydad_logo.png",
      "color": Color(0xFFD32F2F),
      "nickName": "الأحمر",
      "founded": 1937,
      "city": "الدار البيضاء",
      "stadium": "المركب الرياضي محمد الخامس",
      "capacity": 67000,
      "titles": {
        "البطولة": 22,
        "كأس العرش": 9,
        "عصبة الأبطال": 3,
        "السوبر الإفريقي": 2,
        "كأس الكؤوس الإفريقية": 1,
        "كأس محمد السادس": 1,
      },
    },
    {
      "name": "الرجاء البيضاوي",
      "logo": "images/raja_logo.png",
      "color": Color(0xFF006633),
      "nickName": "الخضر",
      "founded": 1949,
      "city": "الدار البيضاء",
      "stadium": "المركب الرياضي محمد الخامس",
      "capacity": 67000,
      "titles": {
        "البطولة": 13,
        "كأس العرش": 8,
        "عصبة الأبطال": 3,
        "السوبر الإفريقي": 1,
        "كأس الكؤوس الإفريقية": 2,
      },
    },
    {
      "name": "الجيش الملكي",
      "logo": "images/armee_logo.png",
      "color": Colors.black,
      "nickName": "العساكر",
      "founded": 1958,
      "city": "الرباط",
      "stadium": "المركب الرياضي الأمير مولاي عبد الله",
      "capacity": 53000,
      "titles": {"البطولة": 13, "كأس العرش": 12, "الكونفدرالية": 1},
    },
    {
      "name": "المغرب الفاسي",
      "logo": "images/mas_logo.png",
      "color": Color(0xFFFBC02D),
      "nickName": "النوارس",
      "founded": 1946,
      "city": "فاس",
      "stadium": "المركب الرياضي فاس",
      "capacity": 45000,
      "titles": {
        "البطولة": 4,
        "كأس العرش": 8,
        "الكونفدرالية": 1,
        "السوبر الإفريقي": 1,
      },
    },
    {
      "name": "حسنية أكادير",
      "logo": "images/husa_logo.png",
      "color": Color(0xFFE53935),
      "nickName": "السوسيون",
      "founded": 1943,
      "city": "أكادير",
      "stadium": "المركب الرياضي أكادير",
      "capacity": 45000,
      "titles": {"البطولة": 2, "كأس العرش": 3, "الكونفدرالية": 1},
    },
    {
      "name": "الدفاع الحسني الجديدي",
      "logo": "images/dhj.png",
      "color": Color(0xFF4CAF50),
      "nickName": "الزعيم",
      "founded": 1957,
      "city": "الجديدة",
      "stadium": "المركب الرياضي الجديدة",
      "capacity": 15000,
      "titles": {"البطولة": 1, "كأس العرش": 2, "السوبر الإفريقي": 1},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🏆 الأندية المغربية "),
        centerTitle: true,
        backgroundColor: const Color(0xff006633),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: teams.length,
        itemBuilder: (_, i) {
          final t = teams[i];
          final totalTitles = (t["titles"] as Map<String, int>).values.reduce(
            (a, b) => a + b,
          );
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // الشعار + الاسم
                  Row(
                    children: [
                      Image.asset(
                        t["logo"],
                        width: 100,
                        height: 100,
                        errorBuilder: (_, __, ___) =>
                            Icon(Icons.shield, size: 100, color: t["color"]),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t["name"],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: t["color"],
                              ),
                            ),
                            Text(
                              "«${t["nickName"]}»",
                              style: TextStyle(
                                fontSize: 16,
                                color: t["color"].withOpacity(.8),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "مدينة: ${t["city"]}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              "تأسيس: ${t["founded"]}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              "الملعب: ${t["stadium"]}",
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              "السعة: ${t["capacity"].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} متفرج",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  // البطولات
                  Text(
                    "الألقاب ($totalTitles)",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...t["titles"].entries.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.key, style: const TextStyle(fontSize: 14)),
                          Chip(
                            label: Text(
                              e.value.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: t["color"],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
