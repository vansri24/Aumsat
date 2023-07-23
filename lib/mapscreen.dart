import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class MyMapScreen extends StatefulWidget
{
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
          interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
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
      Positioned(
        top: MediaQuery.of(context).size.height * 0.08,
        left: MediaQuery.of(context).size.width * 0.15,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add'),
                  content: const Text('Are you sure you want to add?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Confirm'),
                      onPressed: () {
                        // Handle add confirmation
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black.withOpacity(0.5),
          ),
          child: const Text('Add'),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.08,
        left: MediaQuery.of(context).size.width * 0.45,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Edit'),
                  content: const Text('Are you sure you want to edit?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Confirm'),
                      onPressed: () {
                        // Handle edit confirmation
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black.withOpacity(0.5),
          ),
          child: const Text('Edit'),
        ),
      ),

      Positioned(
      top: MediaQuery.of(context).size.height * 0.08,
      left: MediaQuery.of(context).size.width * 0.75,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Delete'),
                content: const Text('Are you sure you want to delete?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Confirm'),
                    onPressed: () {
                      // Handle delete confirmation
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black.withOpacity(0.5),
        ),
        child: const Text('Delete'),
      ),
    ),
    ],
    ),
    );

  }
}
