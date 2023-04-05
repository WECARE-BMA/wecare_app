// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';

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
            children: [
              Container(
                height: 100,
                child: Text(
                  'Okay',
                  style: TextStyle(color: Colors.amber),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(20.0),
                  color: Colors.black,
                  border: Border.all(color: Colors.grey),
                ),
                width: 400.0,
                height: 200.0,
                child: Stack(
                  children: [
                    Image.asset(
                      _imagePaths[_currentIndex],
                      fit: BoxFit.cover,
                      width: 400.0,
                      height: 300.0,
                    ),
                    const Text(
                      '   Help this Kids',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [Container()],
          )
        ],
      ),
    ));
  }
}
