import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class KidCard extends StatelessWidget {
  const KidCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              // padding: const EdgeInsets.only(left: 10),
              height: 300,
              width: 225,
              color: Colors.white,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/image1.jpg',
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 2),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '  Eyosi hemen',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '   12 years Old',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
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
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        elevation: const MaterialStatePropertyAll(0),
                      ),
                      label: const Text(''),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
