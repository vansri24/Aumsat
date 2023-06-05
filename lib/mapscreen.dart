import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';



class MyMapscreen extends StatefulWidget {
const MyMapscreen({Key? key}) : super(key: key);

@override
State<MyMapscreen> createState() => _MyMapscreenState();
}

class _MyMapscreenState extends State<MyMapscreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   title: const Text(''),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(37.7749, -122.4194), // Set the initial map center
          zoom: 13.0, // Set the initial zoom level
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', // Use OpenStreetMap tiles
            subdomains: ['a', 'b', 'c'], // Subdomains for better performance
          ),
        ],
      ),
    );
  }
}
