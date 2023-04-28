import 'package:flutter/material.dart';

class ProfileComponent extends StatelessWidget {
  final String name;
  final String image;
  final String description;


  const ProfileComponent({
    super.key,
    required this.name,
    required this.image,
    required this.description
    });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        CircleAvatar(
                  backgroundImage: NetworkImage(image),
                  radius: 90,
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Text("Donations",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text("\$23k",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 30))
                    ],
                  ),
                ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 7.1,
                  right: screenWidth / 7.1,
                  top: screenHeight / 46.6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 40, height: 1.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenHeight / 46.6,
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  )
                ]
              )
            )
      ],
    );
  }
}