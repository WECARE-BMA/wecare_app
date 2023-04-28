import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:wecare_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_bloc.dart';
import 'package:wecare_app/blocs/nav_bloc/nav_bloc_bloc.dart';
import 'package:wecare_app/blocs/history_bloc/history_bloc.dart';
import 'package:wecare_app/blocs/history_bloc/history_event.dart';
import 'package:wecare_app/firebase_options.dart';
import 'package:wecare_app/service/kidsApiService.dart';
import 'package:wecare_app/views/app_screen.dart';
import 'package:wecare_app/views/auth_pages/signin_page.dart';
import 'package:wecare_app/views/auth_pages/signup_page.dart';
import 'package:wecare_app/views/details_page.dart';
import 'package:wecare_app/views/history_page.dart';
import 'package:wecare_app/views/home_page.dart';
import 'package:wecare_app/views/profile_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wecare_app/views/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MaterialColor myCustomColor = const MaterialColor(0xFFADE25D, {
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(create: (contex) => NavBloc()),
          BlocProvider(create: (context) => HistoryBloc()),
          BlocProvider(create: (context) => DonatedBloc())
        ],
        child: MaterialApp(
            title: 'Wecare',
            theme: ThemeData(
              primarySwatch: myCustomColor,
              // textTheme: GoogleFonts.poppinsTextTheme(
              //   Theme.of(context).textTheme,
              // ),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => IntroScreen(),
              '/signInPage': (context) => SigninPage(),
              '/signUpPage': (context) => SignupPage(),
              '/appScreen': (context) => AppScreen()
            }));
  }
}
