import 'package:flutter/material.dart';

class KidTile extends StatelessWidget {
  final String name;
  final String image;
  final int age;
  final String description;

  KidTile({
    super.key,
    required this.name,
    required this.image,
    required this.age,
    required this.description,
    });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey
          )
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.network(image)
            ),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      '$age',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}