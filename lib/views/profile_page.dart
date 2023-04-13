import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        // child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenHeight / 3.1,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
                child: Image.asset('assets/images/logo.png')
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Causes", style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Text("20", style: TextStyle(fontWeight: FontWeight.w800 , fontSize: 30))
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    backgroundImage: NetworkImage("https://nationaltoday.com/wp-content/uploads/2021/04/Every-Kid-Healthy.jpg"),
                    radius: 90,
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        Text("Donations", style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Text("\$23k", style: TextStyle(fontWeight: FontWeight.w800 , fontSize: 30))
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth / 7.1, right: screenWidth / 7.1, top: screenHeight / 46.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Bekele Mekonene", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 40, height: 1.0), textAlign: TextAlign.center,),
                    SizedBox(height: screenHeight / 46.6,),
                    const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight / 46.6,),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color:
                          Theme.of(context).primaryColor, // set the border color here
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight / 93.2),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('Logout', style: TextStyle(color: Color.fromARGB(228, 202, 60, 50), fontWeight: FontWeight.w600, fontSize: 18)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color.fromARGB(228, 202, 60, 50),
                      ),
                    ),
                  )
                  ],
                ),
              )
            ],
          ),
        
      ),
    );
  }
}