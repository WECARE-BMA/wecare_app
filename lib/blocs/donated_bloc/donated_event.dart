import 'package:equatable/equatable.dart';

abstract class DonatedEvent extends Equatable {}

class GetKidsDonated extends DonatedEvent {
  GetKidsDonated();

  @override
  List<Object> get props => [];
}

class AddKidDonated extends DonatedEvent {
  // String kidList;

  AddKidDonated(
    // {
    // required this.kidList
    // }
    );

  @override
  List<Object> get props => [];
}
