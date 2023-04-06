import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/OnbordingData.dart';
import 'package:flutter_onboarding_screen/flutteronboardingscreens.dart';
import 'package:wecare_app/views/auth_pages/signin_page.dart';

class Onboardingpage extends StatelessWidget {
  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/images/logo.png",
      title: "Donate easily Quickly and on target",
      desc: "",
    ),
    OnbordingData(
      imagePath: "assets/images/logo.png",
      title: "trusted ,transparent & effective in sharing kindness",
      desc: "",
    ),
    OnbordingData(
      imagePath: "assets/images/logo.png",
      title: "fulfill the children's needs",
      desc: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreen(
      list,
      MaterialPageRoute(builder: (context) => SigninPage()),
    );
  }
}
