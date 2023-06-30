import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyMapScreen extends StatefulWidget {
  const MyMapScreen({Key? key}) : super(key: key);

  @override
  State<MyMapScreen> createState() => _MyMapScreenState();
}

class _MyMapScreenState extends State<MyMapScreen> {
  LatLng markerPosition = LatLng(20.5937, 78.9629);

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      setState(() {
        markerPosition = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      // Handle location errors
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: markerPosition,
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 30.0,
                    height: 30.0,
                    point: markerPosition,
                    builder: (context) => Draggable(
                      child: Container(
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.red,
                        ),
                      ),
                      feedback: Container(
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.red,
                        ),
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
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            child: ElevatedButton(
              onPressed: () {
                // Handle button 1 press
              },
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.42,
            child: ElevatedButton(
              onPressed: () {
                // Handle button 2 press
              },
              child: Text('Edit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.80,
            child: ElevatedButton(
              onPressed: () {
                // Handle button 3 press
              },
              child: Text('Delete'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
