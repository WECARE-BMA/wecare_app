import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthBloc()
      : _firebaseAuth = FirebaseAuth.instance,
        super(AuthLoadingState()) {
    @override
    Future<void> onEvent(AuthEvent event, Emitter<AuthState> emit) async {
      if (event is LoginEvent) {
        try {
          emit(AuthLoadingState());
          final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(AuthAuthenticatedState(userCredential.user!));
        } catch (e) {
          emit(AuthFailedState(e.toString()));
        }
      } else if (event is LogoutEvent) {
        try {
          emit(AuthLoadingState());
          await _firebaseAuth.signOut();
          emit(AuthUnauthenticatedState());
        } catch (e) {
          emit(AuthFailedState(e.toString()));
        }
      }
    }
  }
}
