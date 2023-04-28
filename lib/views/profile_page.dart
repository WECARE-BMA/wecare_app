import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:wecare_app/blocs/donor_bloc/donor_bloc.dart';
import 'package:wecare_app/blocs/donor_bloc/donor_event.dart';
import 'package:wecare_app/blocs/donor_bloc/donor_state.dart';
import 'package:wecare_app/components/profile_component.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        // child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: screenHeight / 3.1,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover)),
                child: Image.asset('assets/images/logo.png')),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Causes",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text("20",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 30))
                    ],
                  ),
                ),
                BlocBuilder<DonorBloc, DonorState>(builder: (context, state) {
                  if (state is DonorInitialState) {
                    BlocProvider.of<DonorBloc>(context)
                      .add(GetKidsDonor());
                  } else if (state is DonorLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DonorFailState) {
                    return Text(state.message);
                  } else if (state is DonorSuccessState){
                    return ProfileComponent(
                      name: state.donors.name ,
                       image: "https://firebasestorage.googleapis.com/v0/b/wecare-bma.appspot.com/o/donorsprofile%2Fdetails_image.jpg?alt=media&token=28d16501-20cb-40ce-9ec5-9afbab270981", 
                       description: state.donors.description);
                  
                  }
                  return Container();
          }),
                

                  SizedBox(
                    height: screenHeight / 46.6,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Edit Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Theme.of(context)
                            .primaryColor, // set the border color here
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 93.2),
                  OutlinedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                      Navigator.popAndPushNamed(context, '/signInPage');
                    },
                    child: Text('Logout',
                        style: TextStyle(
                            color: Color.fromARGB(228, 202, 60, 50),
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color.fromARGB(228, 202, 60, 50),
                      ),
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
