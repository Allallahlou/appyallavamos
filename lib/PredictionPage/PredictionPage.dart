// prediction_page.dart
import 'package:flutter/material.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  // مباريات الجولة الأولى (قبل البدء يمكنك توسيعها)
  final List<Map<String, dynamic>> fixtures = const [
    {
      "team1": "المغرب",
      "team2": "جزر القمر",
      "date": "21 ديسمبر 2025",
    },
    {
      "team1": "مالي",
      "team2": "زامبيا",
      "date": "22 ديسمبر 2025",
    },
    {
      "team1": "مصر",
      "team2": "زيمبابوي",
      "date": "22 ديسمبر 2025",
    },
  ];

  final Map<int, String?> _predictions = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🔮 توقع النتيجة"),
        centerTitle: true,
        backgroundColor: const Color(0xff006633),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text(
              "توقع نتيجة المباريات واربح نقاط!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: fixtures.length,
                itemBuilder: (context, i) {
                  final f = fixtures[i];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            f["date"],
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Expanded(child: Center(child: Text(f["team1"], style: const TextStyle(fontWeight: FontWeight.bold)))),
                              const Text("ضد", style: TextStyle(color: Colors.grey)),
                              Expanded(child: Center(child: Text(f["team2"], style: const TextStyle(fontWeight: FontWeight.bold)))),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _scoreField(i, true),
                              const Text(" : ", style: TextStyle(fontSize: 20)),
                              _scoreField(i, false),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                if (_predictions.length < fixtures.length) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("يرجى تعبئة جميع النتائج")),
                  );
                  return;
                }
                // حساب النقاط ببساطة (يمكن توسيعه لاحقًا)
                int points = 0;
                for (var i = 0; i < fixtures.length; i++) {
                  if (_predictions[i] == "1-0") points += 3; // مثال
                }
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("نتيجة توقعاتك"),
                    content: Text("لقد حصلت على $points نقطة!"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("حسنًا"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.save),
              label: const Text("إرسال التوقعات"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffc8102e),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _scoreField(int index, bool isTeam1) {
    return SizedBox(
      width: 45,
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 18),
        decoration: const InputDecoration(
          counterText: "",
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (val) {
          final key = "$index-${isTeam1 ? '1' : '2'}";
          final current = _predictions[index] ?? "0-0";
          final parts = current.split("-");
          final newVal = isTeam1 ? "$val-${parts[1]}" : "${parts[0]}-$val";
          setState(() => _predictions[index] = newVal);
        },
      ),
    );
  }
}