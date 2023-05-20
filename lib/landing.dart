import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyLanding extends StatefulWidget {
  const MyLanding({Key? key}) : super(key: key);

  @override
  _MyLandingState createState() => _MyLandingState();
}

class _MyLandingState extends State<MyLanding> {
  int _currentIndex = 0;

  final List<Widget> _carouselItems = [
    Image.asset('assets/image1.jpg', fit: BoxFit.cover),
    Image.asset('assets/image2.jpg', fit: BoxFit.cover),
    Image.asset('assets/image3.jpg', fit: BoxFit.cover),
    Image.asset('assets/image4.jpg', fit: BoxFit.cover),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Page'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 300.0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: _carouselItems,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _carouselItems.map((item) {
              int index = _carouselItems.indexOf(item);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                  _currentIndex == index ? Colors.blue : Colors.grey[400],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
