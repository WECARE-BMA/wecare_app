import 'package:equatable/equatable.dart';
import 'package:wecare_app/models/donor_model.dart';

abstract class DonorState extends Equatable {}

class DonorInitialState extends DonorState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DonorLoadingState extends DonorState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class DonorSuccessState extends DonorState {
  final Donor donors;

  DonorSuccessState({
    required this.donors, 
  });
  
  @override
  // TODO: implement props
  List<Object> get props => [];
}



class DonorFailState extends DonorState {
  String message;

  DonorFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

