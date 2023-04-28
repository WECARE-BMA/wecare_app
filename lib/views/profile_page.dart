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
            BlocBuilder<DonorBloc, DonorState>(builder: (context, state) {
              if (state is DonorInitialState) {
                BlocProvider.of<DonorBloc>(context).add(GetKidsDonor());
              } else if (state is DonorLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DonorFailState) {
                return Text(state.message);
              } else if (state is DonorSuccessState) {
                return ProfileComponent(
                  donor: state.donors,
                );
              }
              return Container();
            }),
          ],
        ),
      ),
    );
  }
}
