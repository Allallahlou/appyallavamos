// schedule_only_page.dart
import 'package:flutter/material.dart';

class ScheduleOnlyPage extends StatelessWidget {
  const ScheduleOnlyPage({Key? key}) : super(key: key);

  final List<Map> matches = const [
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

  // لوحة الألوان
  static const Color bgDark = Color(0xff121212);
  static const Color cardDark = Color.fromARGB(255, 113, 5, 202);
  static const Color accent = Color(0xff00e676);
  static const Color amberDot = Color(0xffffd600);

  @override
  Widget build(BuildContext context) {
    final grouped = <String, List<Map>>{};
    for (var m in matches) {
      grouped.putIfAbsent(m["date"], () => []).add(m);
    }
    final days = grouped.keys.toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 218, 218),
      appBar: AppBar(
        title: const Text("🏆 البرنامج الكامل"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: days.length,
        separatorBuilder: (_, __) => const SizedBox(height: 24),
        itemBuilder: (context, i) {
          final day = days[i];
          final dayMatches = grouped[day]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(left: 8),
                      decoration: const BoxDecoration(
                        color: amberDot,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      day,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ...dayMatches.map((m) => _matchCard(m)),
            ],
          );
        },
      ),
    );
  }

  Widget _matchCard(Map m) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  m["time"],
                  style: const TextStyle(
                    color: accent,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(Icons.access_time, color: accent, size: 16),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    m["team1"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "⚽",
                    style: TextStyle(color: amberDot, fontSize: 20),
                  ),
                ),
                Expanded(
                  child: Text(
                    m["team2"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              m["stadium"],
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
