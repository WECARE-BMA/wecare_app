import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_bloc.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_event.dart';
import 'package:wecare_app/blocs/history_bloc/history_bloc.dart';
import 'package:wecare_app/blocs/history_bloc/history_event.dart';
import 'package:wecare_app/blocs/history_bloc/history_state.dart';
import 'package:wecare_app/blocs/kid_bloc/kid_bloc.dart';
import 'package:wecare_app/components/donation_tracker.dart';
import 'package:wecare_app/models/kid_model.dart';
import 'package:wecare_app/service/donorsApiService.dart';

import '../service/needsApiService.dart';

class DetailsPage extends StatefulWidget {
  final Kid kid;
  const DetailsPage({super.key, required this.kid});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: screenHeight * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.kid.imageUrl),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter)),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              textAlign: TextAlign.start,
              widget.kid.name,
              style: TextStyle(
                  fontSize: screenHeight * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ),
        Container(
          height: screenHeight * 0.07,
          child: BlocBuilder<KidBloc, KidState>(builder: (context, state) {
            if (state is KidInitial) {
              return Container();
            } else if (state is KidLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is KidFailState) {
              return Text(state.message);
            } else if (state is KidSuccessState) {
              return Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: DonationTracker(kid: widget.kid));
            }
            return Container();
          }),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.06,
              right: screenWidth * 0.06,
              top: screenHeight * 0.009,
              bottom: screenHeight * 0.009),
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
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  'Needs',
                  style: TextStyle(
                      fontSize: screenHeight * 0.03,
                      fontWeight: FontWeight.bold),
                ),
              ),
              NeedsCard(
                needs: widget.kid.needs,
                kid: widget.kid,
              )
            ],
          ),
        )
      ],
    )));
  }
}

class NeedsCard extends StatelessWidget {
  final List? needs;
  final Kid kid;
  const NeedsCard({super.key, required this.needs, required this.kid});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    NeedsServiceProvider ns = NeedsServiceProvider();
    DonorsServiceProvider ds = DonorsServiceProvider();
    User? user = FirebaseAuth.instance.currentUser;
    return Container(
      height: screenHeight * 0.37,
      child: ListView.builder(
        itemCount: needs!.length,
        itemBuilder: (BuildContext context, int index) {
          var need = needs![index];
          return Container(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/need_icon.png',
                  width: screenWidth * 0.15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        need.name,
                        style: TextStyle(
                            fontSize: screenHeight * 0.025,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        need.amount.toString(),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                ),
                Spacer(),
                BlocBuilder<KidBloc, KidState>(builder: (context, state) {
                  if (state is KidInitial) {
                    return Container();
                  } else if (state is KidLoadingState) {
                    return Container();
                  } else if (state is KidFailState) {
                    return Text(state.message);
                  } else if (state is KidSuccessState) {
                    return OutlinedButton(
                      onPressed: need.isDonated
                          ? null
                          : () async {
                              need.isDonated = true;
                              need.donor = user!.uid;

                              ns.updateNeed(need);

                              var donor = await ds.getDonor(user.uid);
                              List<Kid> kidsList = donor.kids ?? [];
                              kidsList.add(kid);
                              donor.kids = kidsList;

                              ds.updateDonor(donor);

                              BlocProvider.of<KidBloc>(context).add(GetKids());
                              BlocProvider.of<DonatedBloc>(context)
                                  .add(GetKidsDonated());
                            },
                      child: need.isDonated ? Text('Donated') : Text('Donate'),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  return Container();
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
