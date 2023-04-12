part of 'donation_bloc.dart';

abstract class DonationState extends Equatable {
  const DonationState();
  
  @override
  List<Object> get props => [];
}

class DonationInitial extends DonationState {}
