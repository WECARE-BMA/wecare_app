import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wecare_app/models/donor_model.dart';
import 'package:wecare_app/service/donorsApiService.dart';
import 'package:wecare_app/service/firestorageService.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoadingState()) {
    final FirebaseAuth _firebaseAuth;
    _firebaseAuth = FirebaseAuth.instance;

    on<LoginEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
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

          final imageUrl = await firestorageService.uploadFile(event.image);

          Donor donor = Donor(
              id: userCredential.user!.uid,
              name: event.name,
              image: imageUrl,
              description: event.description);

          await donorsServiceProvider.addDonor(donor);
        } catch (e) {
          emit(AuthFailedState(e.toString()));
        }
      },
    );
  }
}
