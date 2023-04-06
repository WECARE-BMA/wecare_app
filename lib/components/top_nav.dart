import 'package:flutter/material.dart';

class TopNav extends StatelessWidget {
  const TopNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 20, left: 20),
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/nav_logo.png'),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Code to execute when the button is pressed
                  },
                  icon: const Icon(
                    Icons.bookmark_outline,
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
                ElevatedButton.icon(
                  onPressed: () {
                    // Code to execute when the button is pressed
                  },
                  icon: const Icon(
                    Icons.notifications_none_outlined,
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
              ],
            ),
          ],
        ) // Your content goes here

        );
  }
}
