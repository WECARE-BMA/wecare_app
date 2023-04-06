import 'package:flutter/material.dart';
import 'package:wecare_app/components/kid_tile.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
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
      ),
    );
  }
}