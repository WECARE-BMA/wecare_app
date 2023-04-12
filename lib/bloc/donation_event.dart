part of 'donation_bloc.dart';

abstract class DonationEvent extends Equatable {
  const DonationEvent();

  @override
  List<Object> get props => [];
}

class IncrementDonationEvent extends DonationEvent {}

class DecrementDonationEvent extends DonationEvent {}

class SubmitDonationEvent extends DonationEvent {
  final int donationAmount;

  SubmitDonationEvent({required this.donationAmount});

  @override
  List<Object> get props => [donationAmount];
}
