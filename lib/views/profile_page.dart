import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
                margin: EdgeInsets.only(bottom: 20),
                child: Image.asset('assets/images/logo.png')
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Causes", style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text("20", style: TextStyle(fontWeight: FontWeight.w800 , fontSize: 30))
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://nationaltoday.com/wp-content/uploads/2021/04/Every-Kid-Healthy.jpg"),
                      radius: 90,
                    ),
                  ),
                  Column(
                    children: const [
                      Text("Donations", style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text("\$23k", style: TextStyle(fontWeight: FontWeight.w800 , fontSize: 30))
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80.0, right: 80.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Bekele Mekonene", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 40), textAlign: TextAlign.center,),
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}