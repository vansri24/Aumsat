import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class MyMapScreen extends StatefulWidget {
  const MyMapScreen({Key? key}) : super(key: key);

  @override
  State<MyMapScreen> createState() => _MyMapScreenState();
}

class _MyMapScreenState extends State<MyMapScreen> {
  LatLng markerPosition = const LatLng(37.7749, -122.4194);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FlutterMap(
        options: MapOptions(
          center: const LatLng(37.7749, -122.4194),
          zoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 30.0,
                height: 30.0,
                point: markerPosition,
                builder: (context) => Draggable(
                  feedback: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                  ),
                  onDragEnd: (details) {
                    final newPosition = LatLng(
                      markerPosition.latitude + details.offset.dx / 111111,
                      markerPosition.longitude - details.offset.dy / 111111,
                    );
                    setState(() {
                      markerPosition = newPosition;
                    });
                  },
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
