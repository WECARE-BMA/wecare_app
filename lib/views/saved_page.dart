import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/components/kid_tile.dart';
import 'package:wecare_app/components/top_nav.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_bloc.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_event.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_state.dart';
import 'package:wecare_app/views/details_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<SavedBloc>(context).add(GetKidsSaved());
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: screenWidth,
                  height: screenHeight / 13,
                  child: const TopNav()),
              IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/appScreen');
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(AppLocalizations.of(context)!.saved,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Expanded(child:
                  BlocBuilder<SavedBloc, SavedState>(builder: (context, state) {
                if (state is SavedInitialState) {
                  BlocProvider.of<SavedBloc>(context).add(GetKidsSaved());
                } else if (state is SavedLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SavedFailState) {
                  return Text(state.message);
                } else if (state is SavedSuccessState) {
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
      ),
    );
  }
}
