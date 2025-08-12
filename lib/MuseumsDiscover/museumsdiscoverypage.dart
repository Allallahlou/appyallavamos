// lib/MuseumsDiscoveryPage/MuseumsDiscoveryPage.dart
import 'dart:convert';
import 'package:appyallavamos/MuseumDetailPage/museum_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'museum.dart';

class MuseumsDiscoveryPage extends StatefulWidget {
  const MuseumsDiscoveryPage({Key? key}) : super(key: key);

  @override
  _MuseumsDiscoveryPageState createState() => _MuseumsDiscoveryPageState();
}

class _MuseumsDiscoveryPageState extends State<MuseumsDiscoveryPage> {
  late Future<List<Museum>> _future;
  List<Museum>? _all;
  List<Museum>? _filtered;
  final _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _future = _loadMuseums();
  }

  Future<List<Museum>> _loadMuseums() async {
    final jsonString = await rootBundle.loadString('images/museums.json');
    final list = (json.decode(jsonString) as List)
        .map((e) => Museum.fromJson(e))
        .toList();
    _all = _filtered = list;
    return list;
  }

  void _onSearch(String text) {
    if (text.trim().isEmpty) {
      setState(() => _filtered = _all);
    } else {
      setState(() {
        _filtered = _all!
            .where((m) =>
                m.name.toLowerCase().contains(text.toLowerCase()) ||
                m.city.toLowerCase().contains(text.toLowerCase()) ||
                m.topic.toLowerCase().contains(text.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Museums in Morocco'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: TextField(
              controller: _searchCtrl,
              decoration: InputDecoration(
                hintText: 'Search by name, city or topic…',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: _onSearch,
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Museum>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final list = _filtered ?? snapshot.data!;
          if (list.isEmpty) {
            return const Center(child: Text('No museums found.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: list.length,
            itemBuilder: (_, i) {
              final m = list[i];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: m.image != null
                        ? Image.asset(
                            m.image!,
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.broken_image, size: 40),
                          )
                        : const Icon(Icons.museum, size: 40),
                  ),
                  title: Text(m.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${m.city} • ${m.topic}'),
                  trailing: m.foundedYear != null
                      ? Chip(label: Text('${m.foundedYear}'))
                      : null,
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (_) => MuseumsDiscoveryPage(),
                    ),
                   );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}