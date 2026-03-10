import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong2.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String myApiKey = 'efbc36e3-fdd1-428c-a96d-0dd8038fadb1';

    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(15.3521, 44.2163), // إحداثيات صنعاء بدون const
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.locationiq.com/v3/streets/tiles.json?key=$myApiKey&z={z}&x={x}&y={y}',
            subdomains: const ['us1', 'eu1', 'ap1'],
            userAgentPackageName: 'com.flex_yemen.ultimate',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(15.3521, 44.2163),
                width: 80,
                height: 80,
                child: const Icon(Icons.location_on, color: Color(0xFFFFD700), size: 45),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
