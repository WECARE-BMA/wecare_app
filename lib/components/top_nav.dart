import 'package:flutter/material.dart';

class TopNav extends StatelessWidget {
  const TopNav({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenPadding = screenWidth * 0.05;

    return Container(
          padding: EdgeInsets.only(right: screenPadding, left: screenPadding),
          height: screenHeight * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/nav_logo.png'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Code to execute when the button is pressed
                    },
                    icon: Icon(
                      Icons.bookmark_outline,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Code to execute when the button is pressed
                    },
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ) // Your content goes here
    );
  }
}
