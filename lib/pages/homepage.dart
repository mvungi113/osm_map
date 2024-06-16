import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Real Time Traffic Map',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.green],
            ),
          ),
        ),
      ),
      body: content(),
    );
  }

  Widget content() {
    return FlutterMap(
      options: const MapOptions(
          initialCenter: LatLng(-8.909401, 33.460773),
          initialZoom: 11,
          interactionOptions:
              InteractionOptions(flags: ~InteractiveFlag.doubleTapDragZoom)),
      children: [
        // openStreetMapTileLayer,
        openStreetMapMainRoadsTileLayer,
        const MarkerLayer(
          markers: [
            Marker(
              point: LatLng(-8.8890043, 33.4617997),
              width: 60,
              height: 60,
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.location_pin,
                color: Color.fromARGB(255, 62, 12, 241),
              ),
            ),
          ],
        )
      ],
    );
  }
}

TileLayer get openStreetMapMainRoadsTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
