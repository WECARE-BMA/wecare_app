part of 'kid_bloc.dart';

abstract class KidEvent extends Equatable {
  const KidEvent();

  @override
  List<Object> get props => [];
}

class GetKids extends KidEvent {
  GetKids();

  @override
  List<Object> get props => [];
}
