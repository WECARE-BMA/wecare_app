import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  }
}
