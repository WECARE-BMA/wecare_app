import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/blocs/kid_bloc/kid_bloc.dart';
import 'package:wecare_app/components/kid_card.dart';
import 'package:wecare_app/components/top_nav.dart';
import 'package:wecare_app/views/details_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;
  final List<String> _imagePaths = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
  ];

  @override
  void initState() {
    super.initState();

    // Timer.periodic(const Duration(seconds: 5), (Timer timer) {
    //   setState(() {
    //     _currentIndex = (_currentIndex + 1) % _imagePaths.length;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenPadding = screenWidth * 0.05;

    return RefreshIndicator(
      onRefresh: () async {
        await BlocProvider.of<KidBloc>(context)
          ..add(GetKids());
      },
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: screenPadding, right: screenPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopNav(),
                SizedBox(
                  width: screenWidth - (screenWidth * 0.1),
                  height: screenHeight * 0.18,
                  child: Stack(
                    children: [
                      Image.asset(_imagePaths[_currentIndex],
                          fit: BoxFit.cover, width: screenWidth),
                      Positioned(
                        bottom: 0, // Set the bottom position of the text
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: screenPadding, left: screenPadding),
                          child: Text(
                            AppLocalizations.of(context)!.help,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.01,
                  ),
                  child: Text(
                    textAlign: TextAlign.left,
                    AppLocalizations.of(context)!.urgent,
                    style: const TextStyle(
                      fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                    height: screenHeight * 0.36,
                    child: BlocBuilder<KidBloc, KidState>(
                        builder: (context, state) {
                      if (state is KidInitial) {
                        BlocProvider.of<KidBloc>(context).add(GetKids());
                      } else if (state is KidLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is KidFailState) {
                        return Text(state.message);
                      } else if (state is KidSuccessState) {
                        final uKidList = state.uKidList;
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: uKidList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsPage(kid: uKidList[index])),
                                  );
                                },
                                child: KidCard(
                                  kid: uKidList[index],
                                  name: uKidList[index].name,
                                  image: uKidList[index].imageUrl,
                                  age: uKidList[index].age,
                                ),
                              );
                            });
                      }
                      return Container();
                    })),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.01,
                  ),
                  child: Text(
                      textAlign: TextAlign.left,
                      AppLocalizations.of(context)!.newf,
                      style: const TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                ),
                SizedBox(
                    height: screenHeight * 0.36,
                    child: BlocBuilder<KidBloc, KidState>(
                        builder: (context, state) {
                      if (state is KidInitial) {
                      } else if (state is KidLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is KidFailState) {
                        return Text(state.message);
                      } else if (state is KidSuccessState) {
                        final lKidList = state.lKidList;
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: lKidList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsPage(kid: lKidList[index])),
                                  );
                                },
                                child: KidCard(
                                  kid: lKidList[index],
                                  name: lKidList[index].name,
                                  image: lKidList[index].imageUrl,
                                  age: lKidList[index].age,
                                ),
                              );
                            });
                      }
                      return Container();
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
