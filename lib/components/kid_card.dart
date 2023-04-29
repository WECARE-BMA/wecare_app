import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_bloc.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_event.dart';
import 'package:wecare_app/components/donation_tracker.dart';
import 'package:wecare_app/models/kid_model.dart';
import 'package:wecare_app/service/donorsApiService.dart';
import 'package:wecare_app/service/kidsApiService.dart';
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
    KidsServiceProvider ks = KidsServiceProvider();
    DonorsServiceProvider ds = DonorsServiceProvider();
    User? user = FirebaseAuth.instance.currentUser;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight / 6,
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
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.03,
                            ),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                              fontSize: screenHeight * 0.019,
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
                    onPressed: kid.isSaved
                        ? null
                        : () async {
                            kid.isSaved = true;
                            ks.updateKid(kid);
                            final donor = await ds.getDonor(user!.uid);
                            List savedList = donor.savedKids ?? [];
                            savedList.add(kid);

                            donor.savedKids = savedList;

                            ds.updateDonor(donor);

                            BlocProvider.of<SavedBloc>(context)
                                .add(GetKidsSaved());
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
