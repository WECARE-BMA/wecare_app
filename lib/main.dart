import 'package:flutter/material.dart';
import 'package:wecare_app/views/auth_pages/signin_page.dart';
import 'package:wecare_app/views/auth_pages/signup_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MaterialColor myCustomColor = MaterialColor(0xFFADE25D, {
    50: Color(0xFFF6FFE1),
    100: Color(0xFFE9FFA6),
    200: Color(0xFFDAFF6B),
    300: Color(0xFFCCFF30),
    400: Color(0xFFC2FF0A),
    500: Color(0xFFADE25D),
    600: Color(0xFF9BD055),
    700: Color(0xFF86BA4C),
    800: Color(0xFF72A842),
    900: Color(0xFF578B32),
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: myCustomColor,
          // textTheme: GoogleFonts.poppinsTextTheme(
          //   Theme.of(context).textTheme,
          // ),
        ),
        home: const SigninPage());
  }
}
