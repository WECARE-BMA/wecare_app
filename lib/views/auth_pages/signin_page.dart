import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wecare_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:wecare_app/views/auth_pages/signup_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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
                    height: 250,
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenPadding = screenWidth * 0.05;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          isloading = true;
        }

        if (state is AuthAuthenticatedState) {
          Navigator.popAndPushNamed(context, '/appScreen');
        }

        if (state is AuthFailedState) {
          isloading = false;
          Fluttertoast.showToast(
              msg: state.message,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.redAccent);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(left: screenPadding, right: screenPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: screenPadding),
                  child: Text(
                    'Welcome Back!',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: screenPadding),
                  child: TextFormField(
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.only(
                            top: screenHeight * 0.015,
                            bottom: screenHeight * 0.03,
                            left: screenPadding,
                            right: screenPadding),
                        // hintText: 'Enter your email',
                        labelText: 'Email'),
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Email Address';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: screenPadding),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: EdgeInsets.only(
                          top: screenHeight * 0.015,
                          bottom: screenHeight * 0.03,
                          left: screenPadding,
                          right: screenPadding),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // hintText: 'Enter your password',
                      labelText: 'Password',
                    ),
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      } else if (value.length < 8) {
                        return 'Password must be atleast 8 characters';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.065,
                  child: isloading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
                          },
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
              ],
            ),
          ),
        );
      },
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
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  child: Text('Don\'t have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff787878))),
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, '/signUpPage')),
            ],
          ),
        )
      ],
    );
  }
}
