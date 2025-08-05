// fav_team_page.dart
import 'package:flutter/material.dart';

class FavTeamPage extends StatefulWidget {
  const FavTeamPage({Key? key}) : super(key: key);

  @override
  State<FavTeamPage> createState() => _FavTeamPageState();
}

class _FavTeamPageState extends State<FavTeamPage> {
  // قائمة الفرق المغربية
  final List<Map<String, dynamic>> teams = const [
    {"name": "الوداد البيضاوي", "logo": "images/wydad.png", "color": Colors.red},
    {"name": "الرجاء البيضاوي", "logo": "images/raja.png", "color": Color(0xff006633)},
    {"name": "الجيش الملكي", "logo": "images/armee.png", "color": Color.fromARGB(255, 0, 0, 0)},
    {"name": "المغرب الفاسي", "logo": "images/mas.png", "color": Color.fromARGB(255, 247, 242, 0)},
    {"name": "حسنية أكادير", "logo": "images/husa.png", "color": Color.fromARGB(255, 255, 0, 0)},
    {"name": "الدفاع الحسني الجديدي", "logo": "images/dhj.png", "color": Color.fromARGB(255, 92, 238, 8)},
  ];

  String? _selectedTeam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("❤️ فريقك المفضل"),
        centerTitle: true,
        backgroundColor: const Color(0xff006633),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "اختر فريقك المفضل لتحصل على:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "• إشعارات المباريات\n• آخر الأخبار\n• إحصائيات اللاعبين",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: teams.length,
                itemBuilder: (context, i) {
                  final team = teams[i];
                  final isSelected = _selectedTeam == team["name"];
                  return GestureDetector(
                    onTap: () => setState(() => _selectedTeam = team["name"]),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: isSelected ? team["color"] : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? team["color"] : Colors.grey.shade300,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isSelected
                                ? team["color"].withOpacity(.3)
                                : Colors.grey.shade200,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            team["logo"],
                            width: 60,
                            height: 60,
                            errorBuilder: (_, __, ___) =>
                                Icon(Icons.shield, size: 60, color: team["color"]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            team["name"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black87,
                              fontSize: 13,
                            ),
                          ),
                          if (isSelected)
                            const Icon(Icons.check_circle, color: Colors.white, size: 24),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_selectedTeam != null)
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("✅ تم اختيار $_selectedTeam كفريقك المفضل!"),
                      ),
                    );
                    // يمكنك حفظ القيمة في SharedPreferences أو GetStorage
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("حفظ الاختيار"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff006633),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}