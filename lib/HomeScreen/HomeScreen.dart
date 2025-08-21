import 'package:appyallavamos/TransportPage/TransportPage.dart';
import 'package:appyallavamos/api_service/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<String>> futureCities;

  @override
  void initState() {
    super.initState();
    futureCities = ApiService.getCities(); // الـ endpoint الجديد
  }

  void fetchData() async {
    final msg = await ApiService.getMessage();
    final result = await ApiService.getSum(10, 15);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter + Python")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.directions_bus),
              label: const Text("عرض وسائل النقل"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TransportPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
