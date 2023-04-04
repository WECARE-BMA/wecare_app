import 'package:flutter/material.dart';

void main() {
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: myCustomColor,
        ),
        home: const SigninPage());
  }
}

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.st,
            children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.cover)),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset('assets/images/logo.png')),
              SigninForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Text(
                'Welcome Back',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.only(
                        top: 18, bottom: 18, left: 15, right: 10),
                    // hintText: 'Enter your email',
                    labelText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding:
                      EdgeInsets.only(top: 18, bottom: 18, left: 15, right: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // hintText: 'Enter your password',
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ).toMaterialBorderSide(),
                  elevation: 0,
                ),
              ),
            ),
            ThirdPartyAuths(),
            SizedBox()
          ],
        ),
      ),
    );
  }
}

class ThirdPartyAuths extends StatelessWidget {
  const ThirdPartyAuths({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          child: Text('or continue with'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/google_logo.png'),
                radius: 25,
              ),
            ),
            SizedBox(
              width: 35,
            ),
            GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/fb_logo.png'),
                radius: 25,
              ),
            ),
            SizedBox(
              width: 35,
            ),
            GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  'assets/images/apple_logo.png',
                ),
                radius: 25,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                textAlign: TextAlign.center,
              )
            ],
          ),
        )
      ],
    );
  }
}
