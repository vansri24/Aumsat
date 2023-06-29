import 'package:aumsat/landing.dart';
import 'package:aumsat/profile.dart';
import 'package:aumsat/services.dart';
import 'package:flutter/material.dart';

class MyMapPage extends StatefulWidget {
  const MyMapPage({Key? key}) : super(key: key);

  @override
  _MyMapPageState createState() => _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();

  @override
  void dispose() {
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  bool isButton1Tapped = false;
  bool isButton2Tapped = false;
  bool isButton3Tapped = false;
  bool isButton4Tapped = false;

  int _selectedIndex = 2; // Set the initial selectedIndex to 1 (Services)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      isButton1Tapped = false;
      isButton2Tapped = false;
      isButton3Tapped = false;
      isButton4Tapped = false;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyLanding()),
      );

    }
    else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyServices()),
      );
    }
    else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyMapPage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyProfile()),
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
        title: Text(''),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _latitudeController,
              decoration: InputDecoration(
                labelText: 'Enter Latitude',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.8),
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _longitudeController,
              decoration: InputDecoration(
                labelText: 'Enter Longitude',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.8),
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'mapscreen');
              },
              child: Text(
                'Go to Map',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.8),
              ),
            ),
          ],
        ),
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
