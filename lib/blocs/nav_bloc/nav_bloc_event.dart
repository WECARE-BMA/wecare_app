part of 'nav_bloc_bloc.dart';

abstract class NavEvent extends Equatable {
  const NavEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends NavEvent {
  @override
  List<Object> get props => [];
}

class ClickedPageButton extends NavEvent {
  final int index;

  ClickedPageButton({required this.index});

  @override
  List<Object> get props => [];
}
