// chants_page.dart – كامل + مصحح + متعدد الأغاني
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ChantsPage extends StatefulWidget {
  const ChantsPage({Key? key}) : super(key: key);

  @override
  State<ChantsPage> createState() => _ChantsPageState();
}

class _ChantsPageState extends State<ChantsPage> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  String? _currentPath; // لمعرفة أي أغنية شغالة حالياً

  final List<Map<String, dynamic>> chants = const [
    {
      "team": "الوداد البيضاوي",
      "chant": "أولمبيك ودادية… ودادية!",
      "color": Colors.red,
      "logo": "images/wydad_logo.png",
      "audio": "audios/wydad_chant.mp3",
    },
    {
      "team": "الرجاء البيضاوي",
      "chant": "الرجاء نادي الملك…",
      "color": Color(0xff006633),
      "logo": "images/raja_logo.png",
      "audio": "audios/raja_chant.mp3",
    },
    {
      "team": "الجيش الملكي",
      "chant": "الجيش الجيش…",
      "color": Colors.black,
      "logo": "images/armee_logo.png",
      "audio": "audios/armee_chant.mp3",
    },
    {
      "team": "المغرب الفاسي",
      "chant": "الأولمبيك سلامية…",
      "color": Colors.yellow,
      "logo": "images/mas_logo.png",
      "audio": "audios/mas_chant.mp3",
    },
    {
      "team": "حسنية أكادير",
      "chant": "زعيم الجنوب…",
      "color": Colors.redAccent,
      "logo": "images/husa_logo.png",
      "audio": "audios/husa_chant.mp3",
    },
  ];

  Future<void> _playChant(String path) async {
    try {
      await _player.stop();
      await _player.play(AssetSource(path));
      setState(() {
        _isPlaying = true;
        _currentPath = path;
      });
    } catch (e, stack) {
      debugPrint("❌ خطأ في تشغيل الصوت: $e");
      debugPrint("🔍 Stack: $stack");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("لم يتم العثور على: $path")),
      );
    }
  }

  Future<void> _stop() async {
    await _player.stop();
    setState(() {
      _isPlaying = false;
      _currentPath = null;
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🔊 الفرق المغربية المعروفة"),
        centerTitle: true,
        backgroundColor: const Color(0xff006633),
      ),
      body: Column(
        children: [
          // زر إيقاف يظهر فقط أثناء التشغيل
          if (_isPlaying)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.stop),
                label: const Text("إيقاف"),
                onPressed: _stop,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: chants.length,
              itemBuilder: (context, i) {
                final c = chants[i];
                final isThisPlaying = _isPlaying && _currentPath == c["audio"];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  color: c["color"].withOpacity(.1),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          c["logo"],
                          width: 64,
                          height: 64,
                          errorBuilder: (_, __, ___) =>
                              Icon(Icons.shield, size: 64, color: c["color"]),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            c["team"],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: c["color"],
                            ),
                          ),
                          subtitle: Text(
                            c["chant"],
                            style: const TextStyle(fontSize: 15),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              isThisPlaying ? Icons.pause : Icons.volume_up,
                              color: isThisPlaying ? Colors.red : null,
                            ),
                            onPressed: () => isThisPlaying
                                ? _stop()
                                : _playChant(c["audio"]),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}