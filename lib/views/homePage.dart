// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wecare_app/components/top_nav.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  _Home_Page createState() => _Home_Page();
}

class _Home_Page extends State<Home_Page> {
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
    return Scaffold(
        body: SafeArea(
      child: Column(
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
                padding: const EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                child: Stack(
                  children: [
                    Image.asset(
                      _imagePaths[_currentIndex],
                      fit: BoxFit.cover,
                      width: 400.0,
                      height: 300.0,
                    ),
                    const Positioned(
                      bottom: 0, // Set the bottom position of the text
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30, left: 20),
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
          Row(
            children: [
              ListView(
                children: [],
                scrollDirection: Axis.horizontal,
              )
            ],
          )
        ],
      ),
    ));
  }
}
