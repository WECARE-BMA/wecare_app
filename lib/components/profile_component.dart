import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:wecare_app/models/donor_model.dart';

class ProfileComponent extends StatelessWidget {
  final Donor donor;

  const ProfileComponent({super.key, required this.donor});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final causes = donor.getCauses();
    final total = donor.getTotalDonatedAmount();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Causes",
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Text("$causes",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 30))
                ],
              ),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(donor.image),
              radius: 90,
            ),
            Expanded(
              child: Column(
                children: [
                  Text("Donations",
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Text("\$$total",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 30))
                ],
              ),
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.only(
                left: screenWidth / 7.1,
                right: screenWidth / 7.1,
                top: screenHeight / 46.6),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    donor.name,
                    style: TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 40, height: 1.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenHeight / 46.6,
                  ),
                  Text(
                    donor.description,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  )
                ])),
        SizedBox(
          height: screenHeight / 46.6,
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text('Edit Profile',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color:
                  Theme.of(context).primaryColor, // set the border color here
            ),
          ),
        ),
        SizedBox(height: screenHeight / 93.2),
        OutlinedButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
            Navigator.popAndPushNamed(context, '/signInPage');
          },
          child: Text('Logout',
              style: TextStyle(
                  color: Color.fromARGB(228, 202, 60, 50),
                  fontWeight: FontWeight.w600,
                  fontSize: 18)),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Color.fromARGB(228, 202, 60, 50),
            ),
          ),
        )
      ],
    );
  }
}
