import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

import 'package:aumsat/landing.dart';
import 'package:aumsat/profile.dart';
import 'package:aumsat/services.dart';

class MyMapPage extends StatefulWidget {
  const MyMapPage({Key? key}) : super(key: key);

  @override
  _MyMapPageState createState() => _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {
  int _selectedIndex = 2; // Set the initial selectedIndex to 2 (Map)

  Future<void> _getUserLocation() async {
    LocationPermission permission;

    if (!await Geolocator.isLocationServiceEnabled()) {

      _showErrorDialog('Location services are disabled. Please enable them to use the map.');
      return;
    }


    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {

      _showPermissionDialog();
      return;
    } else if (permission == LocationPermission.deniedForever) {

      _showErrorDialog('Location permission permanently denied. You can grant the permission from the app settings.');
      return;
    }


    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );


    double latitude = position.latitude;
    double longitude = position.longitude;


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapDisplay(latitude: latitude, longitude: longitude),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permission Required'),
          content: const Text('Please enable location permission to use the map.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _getUserLocation(); // Retry getting location after showing the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyLanding()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyServices()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyProfile()),
      );
    } else {
      // Handle other navigation routes here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Enter your farm coordinates',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _getUserLocation();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.8),
                      ),
                      child: const Text(
                        'Go to Map  -->',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MapDisplay extends StatelessWidget {
  final double latitude;
  final double longitude;

  const MapDisplay({super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    // Here, you can display the map using the latitude and longitude
    // For demonstration purposes, we'll show the coordinates in a text widget.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Display'),
      ),
      body: Center(
        child: Text(
          'Latitude: $latitude, Longitude: $longitude',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MyMapPage(),
  ));
}
