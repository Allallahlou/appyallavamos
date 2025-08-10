import 'package:flutter/material.dart';

class StadiumSchedulePage extends StatelessWidget {
  final String stadiumName;
  const StadiumSchedulePage({Key? key, required this.stadiumName})
    : super(key: key);

  // نفس جدول المباريات
  final List<Map<String, dynamic>> stadiums = const [
    {
      "name": "ملعب محمد الخامس",
      "city": "الدار البيضاء",
      "capacity": 45000,
      "image": "images/Mohammed_V_stadium.png",
    },
    {
      "name": "ملعب مولاي الحسن",
      "city": "الرباط",
      "capacity": 22000,
      "image": "images/Stade_My_Hassan.png",
    },
    {
      "name": "المجمع الرياضي الأمير مولاي عبد الله",
      "city": "الرباط",
      "capacity": 21000,
      "image": "images/Stade_Prince_Moulay_Abdellah.png",
    },
    {
      "name": "ملعب البريد",
      "city": "الرباط",
      "capacity": 18000,
      "image": "images/albarid-stadium.png",
    },
    {
      "name": "ملعب المجمع الرياضي",
      "city": "فاس",
      "capacity": 35468,
      "image": "images/Complexe_sportif_de_Fès.png",
    },
    {
      "name": "ملعب ابن بطوطة",
      "city": "طنجة",
      "capacity": 75600,
      "image": "images/Stade_Ibn_Batuta_Tanger.png",
    },
    {
      "name": "ملعب أدرار",
      "city": "أكادير",
      "capacity": 41144,
      "image": "images/Stade-Adrar2019.png",
    },
  ];

  // ---------------- جدول المباريات الكامل ----------------
  final List<Map<String, dynamic>> allMatches = const [
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

  @override
  Widget build(BuildContext context) {
    final matches = allMatches
        .where((m) => m["stadium"].toString().contains(stadiumName))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("مباريات $stadiumName"), centerTitle: true),
      body: matches.isEmpty
          ? const Center(child: Text("لا توجد مباريات"))
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: matches.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) {
                final m = matches[i];
                return ListTile(
                  leading: const Icon(
                    Icons.access_time,
                    color: Color(0xff00e676),
                  ),
                  title: Text("${m["team1"]}  ضد  ${m["team2"]}"),
                  subtitle: Text("${m["date"]}  |  ${m["time"]}"),
                );
              },
            ),
    );
  }
}
