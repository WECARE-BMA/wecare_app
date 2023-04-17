part of 'nav_bloc_bloc.dart';

abstract class NavState extends Equatable {
  const NavState();

  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends NavState {
  final int currentIndex;

  CurrentIndexChanged({required this.currentIndex});

  @override
  List<Object> get props => [];
}

class PageLoading extends NavState {
  @override
  List<Object> get props => [];
}

class HomePageLoaded extends NavState {
  @override
  List<Object> get props => [];
}

class HistroyPageLoaded extends NavState {
  @override
  List<Object> get props => [];
}

class ProfilePageLoaded extends NavState {
  @override
  List<Object> get props => [];
}
