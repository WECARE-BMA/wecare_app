import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wecare_app/components/donation_tracker.dart';
import 'package:wecare_app/models/kid_model.dart';
import 'package:wecare_app/views/auth_pages/signup_page.dart';

class KidCard extends StatelessWidget {
  final Kid kid;
  final String name;
  final String image;
  final int age;

  KidCard({
    super.key,
    required this.kid,
    required this.name,
    required this.image,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight / 2.9,
        width: screenWidth / 1.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: const Color.fromARGB(255, 203, 203, 203))),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          image: DecorationImage(
                              image: NetworkImage(image), fit: BoxFit.cover)),
                      width: screenWidth,
                      height: screenHeight / 5.5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth / 53.7,
                          right: screenWidth / 53.7,
                          top: screenHeight / 93.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '$age',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight / 80,
                          ),
                          SizedBox(
                            width: screenWidth,
                            height: screenHeight / 17,
                            child: DonationTracker(kid: kid),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Code to execute when the button is pressed
                    },
                    icon: const Icon(
                      Icons.bookmark_add_outlined,
                      size: 30,
                    ),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      elevation: const MaterialStatePropertyAll(0),
                    ),
                    label: const Text(''),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
