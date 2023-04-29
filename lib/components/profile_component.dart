import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:wecare_app/models/donor_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wecare_app/models/kid_model.dart';

class ProfileComponent extends StatelessWidget {
  final Donor donor;
  final List<Kid>? kid;

  const ProfileComponent({super.key, required this.donor, required this.kid});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final causes = donor.getCauses(kid);
    final total = donor.getTotalDonatedAmount(kid);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.causes,
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  Text("$causes",
                      style:
                          const TextStyle(fontWeight: FontWeight.w800, fontSize: 30))
                ],
              ),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(donor.image),
              radius: screenHeight / 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!.donation,
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  Text("\$$total",
                      style:
                          const TextStyle(fontWeight: FontWeight.w800, fontSize: 30))
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
                        fontWeight: FontWeight.w800,
                        fontSize: screenHeight / 25,
                        height: 1.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenHeight / 46.6,
                  ),
                  Text(
                    donor.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  )
                ])),
        SizedBox(
          height: screenHeight / 46.6,
        ),
        SizedBox(height: screenHeight / 93.2),
        OutlinedButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
            Navigator.popAndPushNamed(context, '/signInPage');
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Color.fromARGB(228, 202, 60, 50),
            ),
          ),
          child: Text(AppLocalizations.of(context)!.logout,
              style: const TextStyle(
                  color: Color.fromARGB(228, 202, 60, 50),
                  fontWeight: FontWeight.w600,
                  fontSize: 18)),
        )
      ],
    );
  }
}
