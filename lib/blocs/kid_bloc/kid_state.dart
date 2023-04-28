part of 'kid_bloc.dart';

abstract class KidState extends Equatable {
  const KidState();

  @override
  List<Object> get props => [];
}

class KidInitial extends KidState {}

class KidLoadingState extends KidState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class KidFailState extends KidState {
  String message;

  KidFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class KidSuccessState extends KidState {
  final List lKidList;
  final List uKidList;

  KidSuccessState({required this.lKidList, required this.uKidList});

  @override
  List<Object> get props => [];
}
