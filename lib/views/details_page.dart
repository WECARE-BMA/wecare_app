import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_bloc.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_event.dart';
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
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: 250,
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
              icon: const Icon(
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
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ),
        BlocBuilder<KidBloc, KidState>(builder: (context, state) {
          if (state is KidInitial) {
            return Container();
          } else if (state is KidLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is KidFailState) {
            return Text(state.message);
          } else if (state is KidSuccessState) {
            return SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                child: DonationTracker(kid: widget.kid));
          }
          return Container();
        }),
        const Padding(
          padding:
              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Divider(
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Needs',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
    NeedsServiceProvider ns = NeedsServiceProvider();
    DonorsServiceProvider ds = DonorsServiceProvider();
    User? user = FirebaseAuth.instance.currentUser;
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: needs!.length,
        itemBuilder: (BuildContext context, int index) {
          var need = needs![index];
          return Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
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
                        need.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        need.amount.toString(),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                ),
                const Spacer(),
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
                      child: need.isDonated ? const Text('Donated') : const Text('Donate'),
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
