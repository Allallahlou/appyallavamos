import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://127.0.0.1:8000";

  /// كل المدن المستضيفة
  static Future<List<String>> getCities() async {
    final res = await http.get(Uri.parse("$baseUrl/cities"));
    if (res.statusCode == 200) {
      final List<dynamic> data = json.decode(res.body);
      return data.cast<String>();
    }
    return [];
  }

  /// وسائل نقل مدينة معيّنة
  static Future<Map<String, dynamic>> getCityTransports(String city) async {
    final res = await http.get(Uri.parse("$baseUrl/cities/$city"));
    if (res.statusCode == 200) {
      return json.decode(res.body);
    }
    throw Exception("خطأ في تحميل وسائل النقل");
  }

  /// حجز بسيط
  static Future<Map<String, dynamic>?> book({
    required String city,
    required String type,
    required String name,
    required String phone,
    required String date,
  }) async {
    final res = await http.post(
      Uri.parse("$baseUrl/book"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "city": city,
        "transport_type": type,
        "passenger_name": name,
        "phone": phone,
        "date": date,
      }),
    );
    if (res.statusCode == 200) return json.decode(res.body);
    return null;
  }

  static Future getMessage() async {}

  static Future getSum(int i, int j) async {}
}