// heritage_api_service.dart
import 'dart:convert';

import 'package:http/http.dart' as http;

class HeritageApi {
  static const base = "http://127.0.0.1:8001";

  static Future<List<dynamic>> getSites({String? query}) async {
    final uri = Uri.parse("$base/heritage${query != null ? '?q=$query' : ''}");
    final res = await http.get(uri);
    if (res.statusCode == 200) return json.decode(res.body);
    return [];
  }
}
