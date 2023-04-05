import 'package:flutter/material.dart';
import 'package:wecare_app/components/kid_tile.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            const Text(
              "History Page",
              style: TextStyle(fontSize: 20)
            ),
            Expanded(child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return KidTile(
                  name: "Steve Jobs", 
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