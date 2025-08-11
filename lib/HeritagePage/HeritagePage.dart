// heritage_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeritagePage extends StatelessWidget {
  const HeritagePage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> sites = const [
    {
      "name": "فاس البالي",
      "city": "فاس",
      "image": "images/fes_bali.png",
      "desc": "أقدم مدينة إسلامية حية، مدرجة منذ 1981.",
      "icon": Icons.castle,
      "map": "https://maps.apple.com/?q=Fes+Bali+Morocco",
    },
    {
      "name": "جامع الفنا",
      "city": "مراكش",
      "image": "images/jemaa_fna.png",
      "desc": "ساحة الشعب والفنون الشعبية، تراث إنساني.",
      "icon": Icons.groups,
      "map": "https://maps.apple.com/?q=Jemaa+El+Fna+Marrakech",
    },
    {
      "name": "قصبة الأوداية",
      "city": "الرباط",
      "image": "images/oudaya.png",
      "desc": "حصن أندلسي يطل على نهر أبي رقراق.",
      "icon": Icons.fort,
      "map": "https://maps.apple.com/?q=Kasbah+Oudaya+Rabat",
    },
    {
      "name": "كهوف هيرقليون",
      "city": "طنجة",
      "image": "images/hercules.png",
      "desc": "كهوف أسطورية تفتح على المحيط الأطلسي.",
      "icon": Icons.waves,
      "map": "https://maps.apple.com/?q=Hercules+Caves+Tangier",
    },
    {
      "name": "قلعة أكادير",
      "city": "أكادير",
      "image": "images/agadir_kasbah.png",
      "desc": "قلعة تاريخية تشرف على مدينة أكادير.",
      "icon": Icons.temple_buddhist,
      "map": "https://maps.apple.com/?q=Agadir+Kasbah",
    },
    {
      "name": "مسجد الحسن الثاني",
      "city": "الدار البيضاء",
      "image": "images/hassan2.png",
      "desc": "ثالث أكبر مسجد في العالم، معلمة عالمية.",
      "icon": Icons.mosque,
      "map": "https://maps.apple.com/?q=Hassan+II+Mosque+Casablanca",
    },
  ];

  Future<void> _openMap(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🏛️ المعالم التاريخية"),
        centerTitle: true,
        backgroundColor: const Color(0xff006633),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sites.length,
        itemBuilder: (context, i) {
          final s = sites[i];
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            child: Column(
              children: [
                Image.asset(
                  s["image"],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 180,
                    color: Colors.grey[400],
                    child: Icon(s["icon"], size: 64, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s["name"],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        s["city"],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(s["desc"], style: const TextStyle(fontSize: 13)),
                      const SizedBox(height: 8),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: IconButton(
                          icon: const Icon(
                            Icons.map_outlined,
                            color: Colors.green,
                          ),
                          onPressed: () => _openMap(s["map"]),
                        ),
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
