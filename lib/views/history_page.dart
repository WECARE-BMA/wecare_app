import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/components/kid_tile.dart';
import 'package:wecare_app/components/top_nav.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_bloc.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_event.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_state.dart';
import 'package:wecare_app/views/details_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<DonatedBloc>(context).add(GetKidsDonated());
      },
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: screenWidth, height: screenHeight / 13, child: TopNav()),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("History of your donations",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            ),
            Expanded(child: BlocBuilder<DonatedBloc, DonatedState>(
                builder: (context, state) {
              if (state is DonatedInitialState) {
                BlocProvider.of<DonatedBloc>(context).add(GetKidsDonated());
              } else if (state is DonatedLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DonatedFailState) {
                return Text(state.message);
              } else if (state is DonatedSuccessState) {
                final KidL = state.KidL.toSet().toList();
                return ListView.builder(
                    itemCount: KidL.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsPage(kid: KidL[index])),
                            );
                          },
                          child: KidTile(
                            kid: KidL[index],
                            name: KidL[index].name,
                            image: KidL[index].imageUrl,
                            age: KidL[index].age,
                            description: KidL[index].description,
                          ));
                    });
              }
              return Container();
            }))
          ],
        ),
      ),
    );
  }
}
