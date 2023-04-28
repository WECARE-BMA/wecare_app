import 'package:equatable/equatable.dart';

abstract class DonorEvent extends Equatable {}

class GetKidsDonor extends DonorEvent {
  GetKidsDonor();

  @override
  List<Object> get props => [];
}

