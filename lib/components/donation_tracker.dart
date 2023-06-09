import 'package:flutter/material.dart';
import 'package:wecare_app/models/kid_model.dart';

class DonationTracker extends StatefulWidget {
  final Kid kid;
  const DonationTracker({super.key, required this.kid});

  @override
  State<DonationTracker> createState() => _DonationTrackerState();
}

class _DonationTrackerState extends State<DonationTracker> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int currentlyCollected = widget.kid.currentAmount();
    int fullAmount = widget.kid.fullAmount();

    int donors = widget.kid.noOfDonors();

    double progressValue = currentlyCollected / fullAmount;

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '\$$currentlyCollected ',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: screenHeight * 0.02),
              ),
              Text(

                'fund raised from \$$fullAmount',
                style: TextStyle(
                    color: Color(0xff787878), fontSize: screenHeight * 0.02),
              )
            ],
          ),
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: const Color.fromARGB(255, 230, 230, 230),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('$donors ',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  Text(
                    'Donator\'s',
                    style: TextStyle(
                        color: Color(0xff787878),
                        fontSize: screenHeight * 0.02),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
