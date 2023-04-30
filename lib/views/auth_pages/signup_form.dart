import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wecare_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:wecare_app/views/auth_pages/third_party_auth.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late File image;

  final _picker = ImagePicker();

  Future<void> openImagePicker(ImageSource source) async {
    final XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          isloading = true;
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
      child: Form(
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              actionsAlignment: MainAxisAlignment.center,
                              title: Text(
                                'Choose your source',
                                textAlign: TextAlign.center,
                              ),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FilledButton(
                                      style: FilledButton.styleFrom(
                                          backgroundColor: Colors.grey.shade200,
                                          foregroundColor: Colors.black87),
                                      onPressed: () {
                                        Navigator.of(context).pop();

                                        openImagePicker(ImageSource.camera);
                                      },
                                      child: Container(
                                          height: 60,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.add_a_photo_rounded),
                                              Text('Camera')
                                            ],
                                          ))),
                                  FilledButton(
                                      style: FilledButton.styleFrom(
                                          backgroundColor: Colors.grey.shade200,
                                          foregroundColor: Colors.black87),
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        openImagePicker(ImageSource.gallery);
                                      },
                                      child: Container(
                                          height: 60,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.image),
                                              Text('Gallery')
                                            ],
                                          ))),
                                ],
                              ),
                              actions: [
                                FilledButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.add_a_photo_rounded,
                        size: 30,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                child: Text(
                  "*Image is a required field*", 
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.03, 
                    fontWeight: FontWeight.w300,
                    color: Colors.red
                  ),
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
                  controller: nameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.only(
                        top: 18, bottom: 18, left: 15, right: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // hintText: 'Enter your password',
                    labelText: 'Description',
                  ),
                  controller: descriptionController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.only(
                        top: 18, bottom: 18, left: 15, right: 10),
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
                height: 55,
                child: isloading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(SignUpEvent(
                                email: emailController.text,
                                password: passwordController.text,
                                description: descriptionController.text,
                                image: image,
                                name: nameController.text));
                          }
                        },
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
              TextButton(
                  child: Text('Have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff787878))),
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, '/signInPage')),
              // ThirdPartyAuths(),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSoucePicker extends StatelessWidget {
  const ImageSoucePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilledButton(
              style: FilledButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: Colors.black87),
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.all(10),
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo_rounded),
                      Text('Take a Camera')
                    ],
                  ))),
          FilledButton(
              style: FilledButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: Colors.black87),
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.all(10),
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.image), Text('Pick from Gallery')],
                  ))),
        ],
      ),
    );
  }
}
