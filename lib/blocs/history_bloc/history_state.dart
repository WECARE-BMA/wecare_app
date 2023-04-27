import 'package:equatable/equatable.dart';

abstract class HistoryState extends Equatable {}

class HistoryInitialState extends HistoryState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HistoryLoadingState extends HistoryState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class HistorySuccessState extends HistoryState {
  final List KidL;

  HistorySuccessState({
    required this.KidL, 
  });
  
  @override
  // TODO: implement props
  List<Object> get props => [];
}



class HistoryFailState extends HistoryState {
  String message;

  HistoryFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

