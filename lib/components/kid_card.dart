import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wecare_app/components/donation_tracker.dart';

class KidCard extends StatelessWidget {
  const KidCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 360,
        width: 250,
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
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          image: DecorationImage(
                              image: AssetImage('assets/images/image1.jpg'))),
                      width: MediaQuery.of(context).size.width,
                      height: 218,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Abem Mekonene',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '12 years Old',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 240,
                            height: 50,
                            child: DonationTracker(),
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
