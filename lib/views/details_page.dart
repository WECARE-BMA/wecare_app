import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wecare_app/components/donation_tracker.dart';
import 'package:wecare_app/models/kid_model.dart';

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
    return Container(
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
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            // child: DonationTracker(),
          ),
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
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    widget.kid.name,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 20, right: 20),
                //   child: DonationTracker(),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
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
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      NeedsCard(needs: widget.kid.needs)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NeedsCard extends StatelessWidget {
  final List? needs;
  const NeedsCard({super.key, required this.needs});

  @override
  Widget build(BuildContext context) {
    NeedsServiceProvider ns = NeedsServiceProvider();
    return Container(
      height: 350,
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
                Image.asset('assets/images/need_icon.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        need.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        need.amount.toString(),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                ),
                Spacer(),
                OutlinedButton(
                  onPressed: () {
                    need.isDonated = true;
                    need.donor = FirebaseAuth.instance.currentUser?.uid;
                    ns.updateNeed(need);
                  },
                  child: Text('Donate'),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Theme.of(context)
                          .primaryColor, // set the border color here
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
