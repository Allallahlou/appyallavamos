import 'dart:ui';

import 'package:appyallavamos/api_service/api_service.dart';
import 'package:flutter/material.dart';

class CityTransportPage extends StatefulWidget {
  final String city;
  const CityTransportPage({required this.city, Key? key}) : super(key: key);

  @override
  State<CityTransportPage> createState() => _CityTransportPageState();
}

class _CityTransportPageState extends State<CityTransportPage> {
  late Future<Map<String, dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = ApiService.getCityTransports(widget.city);
  }

  // 🔥 ألوان ديناميكية حسب المدينة
  Color get _cityColor {
    switch (widget.city.toLowerCase()) {
      case 'casablanca':
        return Colors.blue.shade900;
      case 'rabat':
        return Colors.teal.shade800;
      case 'tangier':
        return Colors.indigo.shade800;
      case 'marrakech':
        return Colors.orange.shade800;
      case 'fes':
        return Colors.green.shade800;
      case 'agadir':
        return Colors.amber.shade800;
      case 'oujda':
        return Colors.purple.shade800;
      default:
        return Colors.grey.shade800;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Hero(
          tag: 'title-${widget.city}',
          child: Material(
            color: Colors.transparent,
            child: Text(
              widget.city,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.black26,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_cityColor, _cityColor.withOpacity(.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<Map<String, dynamic>>(
          future: futureData,
          builder: (_, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            if (snap.hasError) {
              return Center(
                child: Text(
                  "⚠ خطأ: ${snap.error}",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }
            final transports = snap.data!;
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .85,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: transports.length,
                itemBuilder: (_, i) {
                  final type = transports.keys.elementAt(i);
                  final info = transports[type];
                  return GestureDetector(
                    onTap: () => _openBookingSheet(context, type, info),
                    child: Hero(
                      tag: '$type-${widget.city}',
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.15),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _iconFromName(info["icon"]),
                                    size: 42,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    type.toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    info["line"] ?? info["code"] ?? "",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _openBookingSheet(
    BuildContext ctx,
    String type,
    Map<String, dynamic> info,
  ) {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final dateCtrl = TextEditingController();

    showModalBottomSheet(
      context: ctx,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.15),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white30),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _iconFromName(info["icon"]),
                  size: 48,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                Text(
                  "حجز $type",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextField(nameCtrl, "الاسم الكامل"),
                const SizedBox(height: 12),
                _buildTextField(
                  phoneCtrl,
                  "رقم الهاتف",
                  keyboard: TextInputType.phone,
                ),
                const SizedBox(height: 12),
                _buildTextField(
                  dateCtrl,
                  "التاريخ",
                  readOnly: true,
                  onTap: () async {
                    final d = await showDatePicker(
                      context: ctx,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                    );
                    if (d != null) {
                      dateCtrl.text =
                          "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";
                    }
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () async {
                      if (nameCtrl.text.isEmpty ||
                          phoneCtrl.text.isEmpty ||
                          dateCtrl.text.isEmpty)
                        return;
                      await ApiService.book(
                        city: widget.city,
                        type: type,
                        name: nameCtrl.text,
                        phone: phoneCtrl.text,
                        date: dateCtrl.text,
                      );
                      Navigator.pop(ctx);
                      ScaffoldMessenger.of(ctx).showSnackBar(
                        const SnackBar(
                          content: Text("✅ تم الحجز بنجاح"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: const Text(
                      "تأكيد الحجز",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController ctrl,
    String label, {
    bool readOnly = false,
    VoidCallback? onTap,
    TextInputType? keyboard,
  }) {
    return TextField(
      controller: ctrl,
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: keyboard,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  IconData _iconFromName(String name) {
    switch (name) {
      case "train":
        return Icons.train;
      case "tram":
        return Icons.tram;
      case "directions_bus":
        return Icons.directions_bus;
      case "flight":
        return Icons.flight;
      case "local_taxi":
        return Icons.local_taxi;
      case "directions_boat":
        return Icons.directions_boat;
      default:
        return Icons.directions;
    }
  }
}
