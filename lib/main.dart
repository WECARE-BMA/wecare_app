import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_bloc.dart';
import 'package:wecare_app/blocs/donor_bloc/donor_bloc.dart';
import 'package:wecare_app/blocs/kid_bloc/kid_bloc.dart';
import 'package:wecare_app/blocs/nav_bloc/nav_bloc_bloc.dart';
import 'package:wecare_app/blocs/history_bloc/history_bloc.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_bloc.dart';
import 'package:wecare_app/firebase_options.dart';
import 'package:wecare_app/views/app_screen.dart';
import 'package:wecare_app/views/auth_pages/signin_page.dart';
import 'package:wecare_app/views/auth_pages/signup_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wecare_app/views/saved_page.dart';
import 'package:wecare_app/views/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class Locales {
  static void change(BuildContext context, String locale) {
    var newLocale = Locale(locale);
    MyApp.setLocale(context, newLocale);
  }
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
  }

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', 'am');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
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
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(create: (contex) => NavBloc()),
          BlocProvider(create: (context) => HistoryBloc()),
          BlocProvider(create: (context) => DonatedBloc()),
          BlocProvider(create: (context) => DonorBloc()),
          BlocProvider(create: (context) => SavedBloc()),
          BlocProvider(create: (context) => KidBloc()),
        ],
        child: MaterialApp(
            title: 'Wecare',
            theme: ThemeData(
              primarySwatch: myCustomColor,
              // textTheme: GoogleFonts.poppinsTextTheme(
              //   Theme.of(context).textTheme,
              // ),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: _locale,
            initialRoute: '/',
            routes: {
              '/': (context) => IntroScreen(),
              '/signInPage': (context) => SigninPage(),
              '/signUpPage': (context) => SignupPage(),
              '/appScreen': (context) => AppScreen(),
              '/savedScreen': (context) => SavedPage()
            }));
  }
}
