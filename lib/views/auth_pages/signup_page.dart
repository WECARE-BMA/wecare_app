import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wecare_app/views/auth_pages/signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.st,
              children: [
                Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.cover)),
                    child: Image.asset('assets/images/logo.png')),
                SignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  File? _image;

  final _picker = ImagePicker();

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
    print(pickedImage);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Center(
              child: Container(
                height: 90,
                width: 90,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                    onPressed: _openImagePicker,
                    icon: Icon(Icons.camera_alt_rounded)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: TextFormField(
                style: TextStyle(fontSize: 14),
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
              padding: EdgeInsets.only(bottom: 15),
              child: TextFormField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.only(
                        top: 18, bottom: 18, left: 15, right: 10),
                    // hintText: 'Enter your email',
                    labelText: 'Full Name'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: TextFormField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding:
                      EdgeInsets.only(top: 18, bottom: 18, left: 15, right: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // hintText: 'Enter your password',
                  labelText: 'Description',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: TextFormField(
                style: TextStyle(fontSize: 14),
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
                  'Sign up',
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
          padding: const EdgeInsets.only(bottom: 20, top: 10),
          child: Text(
            'or continue with',
            style: TextStyle(color: Color(0xff787878)),
          ),
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
          padding: const EdgeInsets.only(top: 6, bottom: 20),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  child: Text('Have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff787878))),
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, '/signInPage')),
            ],
          ),
        )
      ],
    );
  }
}
