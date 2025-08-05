// schedule_page.dart
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  // جدول المباريات الكامل
  final List<Map<String, dynamic>> matches = const [
    {
      "date": "21 ديسمبر 2025",
      "time": "20:00",
      "team1": "المغرب",
      "team2": "جزر القمر",
      "stadium": "ملعب الأمير مولاي عبد الله، الرباط",
    },
    {
      "date": "22 ديسمبر 2025",
      "time": "15:30",
      "team1": "مالي",
      "team2": "زامبيا",
      "stadium": "ملعب محمد الخامس، الدار البيضاء",
    },
    {
      "date": "22 ديسمبر 2025",
      "time": "18:00",
      "team1": "مصر",
      "team2": "زيمبابوي",
      "stadium": "ملعب أدرار، أكادير",
    },
    {
      "date": "22 ديسمبر 2025",
      "time": "20:30",
      "team1": "جنوب إفريقيا",
      "team2": "أنغولا",
      "stadium": "ملعب مراكش، مراكش",
    },
    {
      "date": "23 ديسمبر 2025",
      "time": "13:00",
      "team1": "نيجيريا",
      "team2": "تنزانيا",
      "stadium": "ملعب فاس، فاس",
    },
    {
      "date": "23 ديسمبر 2025",
      "time": "15:30",
      "team1": "تونس",
      "team2": "أوغندا",
      "stadium": "الملعب الأولمبي الملحق، الرباط",
    },
    {
      "date": "23 ديسمبر 2025",
      "time": "18:00",
      "team1": "السنغال",
      "team2": "بوتسوانا",
      "stadium": "ملعب ابن بطوطة، طنجة",
    },
    {
      "date": "23 ديسمبر 2025",
      "time": "20:30",
      "team1": "الكونغو DR",
      "team2": "بنين",
      "stadium": "ملعب البريد، الرباط",
    },
    {
      "date": "24 ديسمبر 2025",
      "time": "13:00",
      "team1": "الجزائر",
      "team2": "السودان",
      "stadium": "ملعب مولاي الحسن، الرباط",
    },
    {
      "date": "24 ديسمبر 2025",
      "time": "15:30",
      "team1": "بوركينا فاسو",
      "team2": "غينيا الاستوائية",
      "stadium": "ملعب محمد الخامس، الدار البيضاء",
    },
    {
      "date": "24 ديسمبر 2025",
      "time": "18:00",
      "team1": "ساحل العاج",
      "team2": "موزمبيق",
      "stadium": "ملعب مراكش، مراكش",
    },
    {
      "date": "24 ديسمبر 2025",
      "time": "20:30",
      "team1": "الكاميرون",
      "team2": "الغابون",
      "stadium": "ملعب أدرار، أكادير",
    },
    {
      "date": "26 ديسمبر 2025",
      "time": "13:00",
      "team1": "المغرب",
      "team2": "مالي",
      "stadium": "ملعب الأمير مولاي عبد الله، الرباط",
    },
    {
      "date": "26 ديسمبر 2025",
      "time": "15:30",
      "team1": "زامبيا",
      "team2": "جزر القمر",
      "stadium": "ملعب محمد الخامس، الدار البيضاء",
    },
    {
      "date": "26 ديسمبر 2025",
      "time": "18:00",
      "team1": "مصر",
      "team2": "جنوب إفريقيا",
      "stadium": "ملعب أدرار، أكادير",
    },
    {
      "date": "26 ديسمبر 2025",
      "time": "20:30",
      "team1": "أنغولا",
      "team2": "زيمبابوي",
      "stadium": "ملعب مراكش، مراكش",
    },
    {
      "date": "27 ديسمبر 2025",
      "time": "13:00",
      "team1": "نيجيريا",
      "team2": "تونس",
      "stadium": "ملعب فاس، فاس",
    },
    {
      "date": "27 ديسمبر 2025",
      "time": "15:30",
      "team1": "أوغندا",
      "team2": "تنزانيا",
      "stadium": "ملعب البريد، الرباط",
    },
    {
      "date": "27 ديسمبر 2025",
      "time": "18:00",
      "team1": "السنغال",
      "team2": "الكونغو DR",
      "stadium": "ملعب ابن بطوطة، طنجة",
    },
    {
      "date": "27 ديسمبر 2025",
      "time": "20:30",
      "team1": "بنين",
      "team2": "بوتسوانا",
      "stadium": "الملعب الأولمبي الملحق، الرباط",
    },
    {
      "date": "28 ديسمبر 2025",
      "time": "13:00",
      "team1": "الجزائر",
      "team2": "بوركينا فاسو",
      "stadium": "ملعب مولاي الحسن، الرباط",
    },
    {
      "date": "28 ديسمبر 2025",
      "time": "15:30",
      "team1": "غينيا الاستوائية",
      "team2": "السودان",
      "stadium": "ملعب محمد الخامس، الدار البيضاء",
    },
    {
      "date": "28 ديسمبر 2025",
      "time": "18:00",
      "team1": "ساحل العاج",
      "team2": "الكاميرون",
      "stadium": "ملعب مراكش، مراكش",
    },
    {
      "date": "28 ديسمبر 2025",
      "time": "20:30",
      "team1": "الغابون",
      "team2": "موزمبيق",
      "stadium": "ملعب أدرار، أكادير",
    },
    {
      "date": "29 ديسمبر 2025",
      "time": "18:30",
      "team1": "زامبيا",
      "team2": "المغرب",
      "stadium": "ملعب الأمير مولاي عبد الله، الرباط",
    },
    {
      "date": "29 ديسمبر 2025",
      "time": "18:30",
      "team1": "جزر القمر",
      "team2": "مالي",
      "stadium": "ملعب محمد الخامس، الدار البيضاء",
    },
    {
      "date": "29 ديسمبر 2025",
      "time": "20:30",
      "team1": "أنغولا",
      "team2": "مصر",
      "stadium": "ملعب أدرار، أكادير",
    },
    {
      "date": "29 ديسمبر 2025",
      "time": "20:30",
      "team1": "زيمبابوي",
      "team2": "جنوب إفريقيا",
      "stadium": "ملعب مراكش، مراكش",
    },
    {
      "date": "30 ديسمبر 2025",
      "time": "18:00",
      "team1": "أوغندا",
      "team2": "نيجيريا",
      "stadium": "ملعب فاس، فاس",
    },
    {
      "date": "30 ديسمبر 2025",
      "time": "18:00",
      "team1": "تنزانيا",
      "team2": "تونس",
      "stadium": "الملعب الأولمبي الملحق، الرباط",
    },
    {
      "date": "30 ديسمبر 2025",
      "time": "20:30",
      "team1": "بنين",
      "team2": "السنغال",
      "stadium": "ملعب ابن بطوطة، طنجة",
    },
    {
      "date": "30 ديسمبر 2025",
      "time": "20:30",
      "team1": "بوتسوانا",
      "team2": "الكونغو DR",
      "stadium": "ملعب البريد، الرباط",
    },
    {
      "date": "31 ديسمبر 2025",
      "time": "18:00",
      "team1": "غينيا الاستوائية",
      "team2": "الجزائر",
      "stadium": "ملعب مولاي الحسن، الرباط",
    },
    {
      "date": "31 ديسمبر 2025",
      "time": "18:00",
      "team1": "السودان",
      "team2": "بوركينا فاسو",
      "stadium": "ملعب محمد الخامس، الدار البيضاء",
    },
    {
      "date": "31 ديسمبر 2025",
      "time": "20:30",
      "team1": "الغابون",
      "team2": "ساحل العاج",
      "stadium": "ملعب مراكش، مراكش",
    },
    {
      "date": "31 ديسمبر 2025",
      "time": "20:30",
      "team1": "موزمبيق",
      "team2": "الكاميرون",
      "stadium": "ملعب أدرار، أكادير",
    },
  ];

  // تجميع المباريات حسب اليوم
  Map<String, List<Map<String, dynamic>>> _groupByDate() {
    final grouped = <String, List<Map<String, dynamic>>>{};
    for (var m in matches) {
      grouped.putIfAbsent(m["date"] as String, () => []).add(m);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    final grouped = _groupByDate();
    final days = grouped.keys.toList()..sort();

    return Scaffold(
      appBar: AppBar(
        title: const Text("📅 توقيت المباريات"),
        centerTitle: true,
        backgroundColor: const Color(0xff006633),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: days.length,
        itemBuilder: (context, i) {
          final day = days[i];
          final dayMatches = grouped[day]!;
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // عنوان اليوم
                  Text(
                    day,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // المباريات
                  ...dayMatches.map((m) => _matchTile(m)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _matchTile(Map<String, dynamic> match) {
    return Builder(
      builder: (ctx) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            // الوقت
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xffc8102e),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                match["time"] as String,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // الفريقان
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${match["team1"]}  ضد  ${match["team2"]}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    match["stadium"] as String,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today, size: 18),
              onPressed: () {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(
                    content: Text(
                      "✅ تم نسخ مباراة ${match["team1"]} vs ${match["team2"]}",
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
