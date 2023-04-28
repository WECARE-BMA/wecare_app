// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/blocs/history_bloc/history_bloc.dart';
import 'package:wecare_app/blocs/history_bloc/history_event.dart';
import 'package:wecare_app/blocs/history_bloc/history_state.dart';
import 'package:wecare_app/blocs/kid_bloc/kid_bloc.dart';
import 'package:wecare_app/components/kid_card.dart';
import 'package:wecare_app/components/kid_tile.dart';
import 'package:wecare_app/components/top_nav.dart';
import 'package:wecare_app/views/details_page.dart';

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
                TopNav(),
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
                          child: const Text(
                            'Help this Kids',
                            style: TextStyle(
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
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Urgent Fundrasing',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                    height: screenHeight / 3,
                    child: BlocBuilder<KidBloc, KidState>(
                        builder: (context, state) {
                      if (state is KidInitial) {
                        BlocProvider.of<KidBloc>(context).add(GetKids());
                      } else if (state is KidLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is KidFailState) {
                        return Text(state.message);
                      } else if (state is KidSuccessState) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.uKidList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                            kid: state.uKidList[index])),
                                  );
                                },
                                child: KidCard(
                                  kid: state.uKidList[index],
                                  name: state.uKidList[index].name,
                                  image: state.uKidList[index].imageUrl,
                                  age: state.uKidList[index].age,
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
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'New Fundrasing',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                    height: screenHeight / 3,
                    child: BlocBuilder<KidBloc, KidState>(
                        builder: (context, state) {
                      if (state is KidInitial) {
                      } else if (state is KidLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is KidFailState) {
                        return Text(state.message);
                      } else if (state is KidSuccessState) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.lKidList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                            kid: state.lKidList[index])),
                                  );
                                },
                                child: KidCard(
                                  kid: state.lKidList[index],
                                  name: state.lKidList[index].name,
                                  image: state.lKidList[index].imageUrl,
                                  age: state.lKidList[index].age,
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
