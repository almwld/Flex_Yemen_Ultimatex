import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong2.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // المفتاح الخاص بك الذي أرسلته
    const String myApiKey = 'efbc36e3-fdd1-428c-a96d-0dd8038fadb1';

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(15.3521, 44.2163), // موقع صنعاء
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                // رابط الاستدعاء باستخدام المفتاح الخاص بك
                urlTemplate: 'https://{s}.locationiq.com/v3/streets/tiles.json?key=$myApiKey&z={z}&x={x}&y={y}',
                subdomains: const ['us1', 'eu1', 'ap1'],
                userAgentPackageName: 'com.flexyemen.ultimate',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(15.3521, 44.2163),
                    width: 50,
                    height: 50,
                    child: Icon(Icons.location_on, color: Color(0xFFD4AF37), size: 40),
                  ),
                ],
              ),
            ],
          ),
          // زر العودة للخلف (إذا كانت الشاشة مفتوحة فوق شاشة أخرى)
          Positioned(
            top: 40,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Color(0xFFD4AF37)),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
