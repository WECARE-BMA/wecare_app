import 'package:equatable/equatable.dart';

abstract class SavedState extends Equatable {}

class SavedInitialState extends SavedState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SavedLoadingState extends SavedState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class SavedSuccessState extends SavedState {
  final List KidL;

  SavedSuccessState({
    required this.KidL, 
  });
  
  @override
  // TODO: implement props
  List<Object> get props => [];
}



class SavedFailState extends SavedState {
  String message;

  SavedFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

