part of 'donation_bloc.dart';

abstract class DonationState extends Equatable {
  final int donationAmount;

  DonationState({required this.donationAmount});

  @override
  List<Object> get props => [donationAmount];
}

class DonationInitialState extends DonationState {
  DonationInitialState() : super(donationAmount: 0);
}

class DonationUpdatedState extends DonationState {
  DonationUpdatedState({required int donationAmount})
      : super(donationAmount: donationAmount);
}
