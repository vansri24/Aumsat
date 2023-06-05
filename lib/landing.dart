import 'package:aumsat/mapscreen.dart';
import 'package:aumsat/profile.dart';
import 'package:aumsat/services.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyLanding extends StatefulWidget {
  const MyLanding({Key? key}) : super(key: key);

  @override
  _MyLandingState createState() => _MyLandingState();
}

class _MyLandingState extends State<MyLanding> {
  final List<Widget> _carouselItems = [
    Image.asset('assets/image1.jpg', fit: BoxFit.cover),
    Image.asset('assets/image2.jpg', fit: BoxFit.cover),
    Image.asset('assets/image3.jpg', fit: BoxFit.cover),
    Image.asset('assets/image4.jpg', fit: BoxFit.cover),
  ];

  int _selectedIndex = 0;



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyServices()),
      );
    }
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyMapscreen()),
      );
    }
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyProfile()),
      );
    }else {
      // Handle other navigation routes here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Replace with your desired background color
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Services'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0, // Adjust the height as desired
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {});
                },
              ),
              items: _carouselItems.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Black color with opacity
                        width: 3.0,
                      ),
                    ),
                    child: item,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'groundwater');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black, // Black color
                            width: 2.0,
                          ),
                        ),
                        width: 80 * 4,
                        height: 80.0, // Increase the height as desired
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/grounddd.jfif',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'pipeline');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black, // Black color
                            width: 2.0,
                          ),
                        ),
                        width: 80 * 4,
                        height: 80.0, // Increase the height as desired
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/pipe.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'waterconditioner');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black, // Black color
                            width: 2.0,
                          ),
                        ),
                        width: 80 * 4,
                        height: 80.0, // Increase the height as desired
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/conditioner.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'miscell');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black, // Black color
                            width: 2.0,
                          ),
                        ),
                        width: 80 * 4,
                        height: 80.0, // Increase the height as desired
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/miscell.jfif',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
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
      ),
    );
  }
}
