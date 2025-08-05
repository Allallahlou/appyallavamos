// food_page.dart
import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> foods = const [
    {
      "name": "الكسكس الأصلي",
      "city": "فاس / مراكش",
      "image": "images/couscous.png",
      "desc": "كسكس بالخضر واللحم المغربي التقليدي.",
      "resto": "مطعم دار رقية – فاس",
    },
    {
      "name": "البسطيلة الحلوة",
      "city": "فاس",
      "image": "images/pastilla.png",
      "desc": "ورق مقلي بالسمك والحلوى، مزيج من الحلاوة والمالحة.",
      "resto": "مطعم النجمة – فاس",
    },
    {
      "name": "الطنجية المراكشية",
      "city": "مراكش",
      "image": "images/tanjia.png",
      "desc": "لحم بصلصة الزيت والليمون المحفوظ، يطهى في الفرن التقليدي.",
      "resto": "مطعم الدار البيضاء – مراكش",
    },
    {
      "name": "السردين المشوي",
      "city": "أكادير",
      "image": "images/sardine.png",
      "desc": "سردين طازج مع عصير الليمون والكمون على الشاطئ.",
      "resto": "سوق السمك – أكادير",
    },
    {
      "name": "الرغيف البلدي",
      "city": "طنجة",
      "image": "images/bread.png",
      "desc": "خبز طنجاوي مقلي، يقدم مع الزبدة والعسل.",
      "resto": "فرن الحمام – طنجة المدينة",
    },
    {
      "name": "البريوات باللوز",
      "city": "الرباط",
      "image": "images/briouat.png",
      "desc": "معجنات مقرمشة محشوة باللوز والعسل.",
      "resto": "مقهى جامع الفنا – الرباط",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🍽️ أحسن الوجبات في المغرب"),
        centerTitle: true,
        backgroundColor: const Color(0xffc8102e),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: foods.length,
        itemBuilder: (context, i) {
          final f = foods[i];
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: Column(
              children: [
                Image.asset(
                  f["image"],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 180,
                    color: Colors.amber,
                    child: const Icon(Icons.restaurant, size: 64),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        f["name"],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        f["city"],
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        f["desc"],
                        style: const TextStyle(fontSize: 13),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.location_pin, size: 16),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              f["resto"],
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff006633),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}