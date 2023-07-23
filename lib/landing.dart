import 'package:aumsat/mappage.dart';
import 'package:aumsat/profile.dart';
import 'package:aumsat/services.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ServiceCardData {
  final String imagePath;
  final String title;
  final String description;
  final String routeName;

  ServiceCardData({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.routeName,
  });
}

class MyLanding extends StatefulWidget {
  const MyLanding({Key? key}) : super(key: key);

  @override
  State<MyLanding> createState() => _MyLandingState();
}

class _MyLandingState extends State<MyLanding> {
  final List<ServiceCardData> serviceCards = [
    ServiceCardData(
      imagePath: 'assets/grounddd.jfif',
      title: 'Groundwater',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      routeName: 'groundwater',
    ),
    ServiceCardData(
      imagePath: 'assets/pipe.jpg',
      title: 'Pipeline Detector',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      routeName: 'pipeline',
    ),
    ServiceCardData(
      imagePath: 'assets/conditioner.jpg',
      title: 'Water Conditioner',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      routeName: 'waterconditioner',
    ),
    ServiceCardData(
      imagePath: 'assets/miscell.jfif',
      title: 'Miscellaneous',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      routeName: 'miscell',
    ),
  ];

  final List<Widget> _carouselItems = [
    Image.asset('assets/image1.jpeg', fit: BoxFit.cover),
    Image.asset('assets/image2.jpg', fit: BoxFit.cover),
    Image.asset('assets/image3.jpg', fit: BoxFit.cover),
    Image.asset('assets/image4.jpg', fit: BoxFit.cover),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyServices()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyMapPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyProfile()),
        );
        break;
      default:
      // Handle other navigation routes here
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Services'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: screenHeight * 0.25,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {});
                },
              ),
              items: _carouselItems.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: screenWidth * 0.9,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
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
                child: ListView.builder(
                  itemCount: serviceCards.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, serviceCards[index].routeName);
                      },
                      child: FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
                            child: Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.10,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(serviceCards[index].imagePath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          serviceCards[index].title,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          serviceCards[index].description,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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