import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wecare_app/models/donor_model.dart';
import 'package:wecare_app/service/HiveService.dart';
import 'package:wecare_app/service/donorsApiService.dart';
import 'package:wecare_app/service/firestorageService.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoadingState()) {
    final FirebaseAuth _firebaseAuth;
    _firebaseAuth = FirebaseAuth.instance;
    DonorsServiceProvider donorsServiceProvider = DonorsServiceProvider();
    HiveService hiveService = HiveService();

    on<LoginEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          User? user = userCredential.user;

          Donor donor = await donorsServiceProvider.getDonor(user!.uid);
          final donorJson = donor.toJson();

          final d = await hiveService.create(
              'donors', userCredential.user!.uid, donorJson);

          final x = await hiveService.read('donors', userCredential.user!.uid);
          print(x);

          emit(AuthAuthenticatedState(userCredential.user!));
        } on FirebaseAuthException catch (e) {
          emit(AuthFailedState(e.toString()));
        }
      },
    );

    on<LogoutEvent>(
      (event, emit) async {
        try {
          await _firebaseAuth.signOut();
          emit(AuthUnauthenticatedState());
        } catch (e) {
          emit(AuthFailedState(e.toString()));
        }
      },
    );

    on<SignUpEvent>(
      (event, emit) async {
        DonorsServiceProvider donorsServiceProvider = DonorsServiceProvider();
        FirestorageService firestorageService = FirestorageService();

        try {
          final UserCredential userCredential =
              await _firebaseAuth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          final String imageUrl =
              await firestorageService.uploadFile(event.image);

          Donor donor = Donor(
            id: userCredential.user!.uid,
            image: imageUrl,
            description: event.description,
            name: event.name,
          );

          await donorsServiceProvider.addDonor(donor);

          emit(AuthAuthenticatedState(userCredential.user!));
        } catch (e) {
          emit(AuthFailedState(e.toString()));
        }
      },
    );
  }
}
