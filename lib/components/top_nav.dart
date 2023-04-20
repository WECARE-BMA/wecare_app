import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/top_nav_bloc/icon_bloc.dart';
import '../blocs/top_nav_bloc/icon_state.dart';

class TopNav extends StatelessWidget {
  final bool isHomePage;

  const TopNav({Key? key, required this.isHomePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenPadding = screenWidth * 0.05;

    return Expanded(
      child: BlocBuilder<IconBloc, IconState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(right: screenPadding, left: screenPadding),
            height: screenHeight * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isHomePage
                    ? Image.asset('assets/images/nav_logo.png')
                    : Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).primaryColor,
                      ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Code to execute when the button is pressed
                      },
                      icon: Icon(
                        state.icon1,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Code to execute when the button is pressed
                      },
                      icon: Icon(
                        state.icon2,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
