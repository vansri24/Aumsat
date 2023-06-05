import 'package:flutter/material.dart';

class MyMiscell extends StatefulWidget {
  const MyMiscell({Key? key}) : super(key: key);

  @override
  State<MyMiscell> createState() => _MyMiscellState();
}

class _MyMiscellState extends State<MyMiscell> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Miscellaneous'),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 12.0, 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5), // White color with opacity
                      width: 10.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),

                    child: Image.asset(
                      'assets/watercon.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed ac justo neque. Phasellus eget congue magna. '
                      'Aenean tempus urna eget mauris commodo, ut rutrum lectus dignissim. '
                      'Vivamus a libero felis. Sed ac quam quam. Ut id nunc id justo convallis semper ut ac dolor. '
                      'Praesent imperdiet, metus ut finibus tincidunt, ipsum arcu sollicitudin neque, vitae tincidunt purus libero nec ex.',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
