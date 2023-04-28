import 'package:equatable/equatable.dart';
import 'package:wecare_app/models/donor_model.dart';
import 'package:wecare_app/models/kid_model.dart';

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
  final List<Kid>? kids;

  DonorSuccessState({
    required this.donors, 
    this.kids
  });
  
  @override
  // TODO: implement props
  List<Object> get props => [];
}



class DonorFailState extends DonorState {
  final String message;

  DonorFailState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

