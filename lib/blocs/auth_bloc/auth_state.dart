part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthUnknownState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthAuthenticatedState extends AuthState {
  final User user;

  AuthAuthenticatedState(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthFailedState extends AuthState {
  final String message;

  AuthFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
