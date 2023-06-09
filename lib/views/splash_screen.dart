import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:wecare_app/views/app_screen.dart';
import 'package:wecare_app/views/auth_pages/signin_page.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return SplashScreen(
      navigateAfterSeconds: result != null ? const AppScreen() : const SigninPage(),
      seconds: 1,
      title: const Text(''),
      image: Image.asset('assets/images/logo.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: const TextStyle(),
      photoSize: 100.0,
      loaderColor: Theme.of(context).primaryColor,
      loadingText: const Text(''),
      loadingTextPadding:
          EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      useLoader: true,
    );
  }
}
