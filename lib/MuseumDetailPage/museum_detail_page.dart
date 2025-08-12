import 'package:appyallavamos/MuseumsDiscover/Museum.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MuseumDetailPage extends StatelessWidget {
  final Museum museum;
  const MuseumDetailPage({Key? key, required this.museum}) : super(key: key);

  Future<void> _openMaps() async {
    final query = Uri.encodeComponent('${museum.name} ${museum.city} Morocco');
    final url = 'https://www.google.com/maps/search/?api=1&query=$query';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'museum-${museum.id}',
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: museum.image != null
                    ? Image.asset(museum.image!, fit: BoxFit.cover)
                    : const Icon(Icons.museum, size: 100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    museum.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('City: ${museum.city}'),
                  Text('Topic: ${museum.topic}'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.map),
                        label: const Text('Open Map'),
                        onPressed: _openMaps,
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.share),
                        label: const Text('Share'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
