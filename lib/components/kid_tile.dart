import 'package:flutter/material.dart';
import 'package:wecare_app/components/donation_tracker.dart';

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
            color: Color.fromARGB(255, 203, 203, 203)
          )
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), topLeft: Radius.circular(12)),
                image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)
              ),
              width: 120,
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold ,
                          fontSize: 20
                        ),
                      ),
                      Text(
                        '$age years old',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 240,
                    height: 50,
                    child: const DonationTracker()
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}