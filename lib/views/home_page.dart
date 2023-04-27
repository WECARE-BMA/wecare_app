// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wecare_app/components/kid_card.dart';
import 'package:wecare_app/components/top_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;
  final List<String> _imagePaths = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
  ];

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imagePaths.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenPadding = screenWidth * 0.05;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: screenPadding, right: screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    TopNav(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth - (screenWidth * 0.1),
                      height: screenHeight * 0.18,
                      child: Stack(
                        children: [
                          Image.asset(_imagePaths[_currentIndex],
                              fit: BoxFit.cover, width: screenWidth),
                          Positioned(
                            bottom: 0, // Set the bottom position of the text
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: screenPadding, left: screenPadding),
                              child: Text(
                                'Help this Kids',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.01,
                  ),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Urgent Fundrasing',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  children: const [
                    KidCard(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.01,
                  ),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'New Fundrasing',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  children: const [KidCard()],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
