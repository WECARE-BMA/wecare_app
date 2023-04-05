import 'package:flutter/material.dart';

class DonationTracker extends StatefulWidget {
  const DonationTracker({super.key});

  @override
  State<DonationTracker> createState() => _DonationTrackerState();
}

class _DonationTrackerState extends State<DonationTracker> {
  double currently_collected = 2500.00;
  double full_amount = 5000;
  int donors = 4;
  int days = 12;

  @override
  Widget build(BuildContext context) {
    double progress_value = currently_collected / full_amount;

    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '\$$currently_collected ',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
              Text(
                'fund raised from \$$full_amount',
                style: TextStyle(color: Color(0xff787878)),
              )
            ],
          ),
          LinearProgressIndicator(
            value: progress_value,
            backgroundColor: Color.fromARGB(255, 230, 230, 230),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('$donors ',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  Text(
                    'Donator\'s',
                    style: TextStyle(color: Color(0xff787878)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '$days',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    ' day\’s left',
                    style: TextStyle(color: Color(0xff787878)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
