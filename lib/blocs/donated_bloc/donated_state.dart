import 'package:equatable/equatable.dart';

abstract class DonatedState extends Equatable {}

class DonatedInitialState extends DonatedState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DonatedLoadingState extends DonatedState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class DonatedSuccessState extends DonatedState {
  final List KidL;

  DonatedSuccessState({
    required this.KidL, 
  });
  
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class DonatedFailState extends DonatedState {
  String message;

  DonatedFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

