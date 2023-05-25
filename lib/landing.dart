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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Replace with your desired background color
      ),
      child: Scaffold(
        backgroundColor: Colors.blueAccent.withOpacity(0.5),
        appBar: AppBar(
          title: Text('Services'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {});
                },
              ),
              items: _carouselItems.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5), // White color with opacity
                        width: 10.0,
                      ),
                    ),
                    child: item,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25.0,
                  crossAxisSpacing: 25.0,
                  children: [
                    GestureDetector(
                      onTap: () {
                          Navigator.pushNamed(context, 'waterconditioner');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/button1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'landing');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/button2.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'landing');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/button3.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'landing');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/button4.jpg',
                            fit: BoxFit.cover,
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
      ),
    );
  }
}
