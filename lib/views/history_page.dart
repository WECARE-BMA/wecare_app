import 'package:flutter/material.dart';
import 'package:wecare_app/components/kid_tile.dart';
import 'package:wecare_app/components/top_nav.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth,
              height: screenHeight / 13,
              child: TopNav()
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "History of your donations",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                )
              ),
            ),
            Expanded(child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return KidTile(
                  name: "Abel Mekonene", 
                  image: "https://nationaltoday.com/wp-content/uploads/2021/04/Every-Kid-Healthy.jpg", 
                  age: 12, 
                  description: "Lorem Ipsum blah blah some stuff just talking, also very good student we love homeboy"
                );
              }
            )
          )],
        ),
      ),
    );
  }
}