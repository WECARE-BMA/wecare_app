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
    int currently_collected = widget.kid.currentAmount();
    int full_amount = widget.kid.fullAmount();
    int donors = widget.kid.noOfDonors();

    double progress_value = currently_collected / full_amount;

    return Container(
      height: double.infinity,
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
            mainAxisAlignment: MainAxisAlignment.end,
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
            ],
          )
        ],
      ),
    );
  }
}
