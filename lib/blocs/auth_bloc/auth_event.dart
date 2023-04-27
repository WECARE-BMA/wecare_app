part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String description;
  final File image;

  const SignUpEvent({
    required this.password,
    required this.name,
    required this.description,
    required this.image,
    required this.email,
  });

  @override
  List<Object> get props => [];
}

class LogoutEvent extends AuthEvent {}
