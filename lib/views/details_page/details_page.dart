import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wecare_app/components/donation_tracker.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/details_image.png'),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Bekele Mekureya',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff212121)),
          ),
        ),
        DonationTracker(),
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Divider(
            thickness: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Needs',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              NeedsCard()
            ],
          ),
        )
      ],
    )));
  }
}

class NeedsCard extends StatelessWidget {
  const NeedsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/need_icon.png'),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Health Needs',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$4200',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )
              ],
            ),
          ),
          Spacer(),
          OutlinedButton(
            onPressed: () {},
            child: Text('Pledge'),
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color:
                    Theme.of(context).primaryColor, // set the border color here
              ),
            ),
          )
        ],
      ),
    );
  }
}
