import 'package:equatable/equatable.dart';

abstract class DonationEvent extends Equatable {
  const DonationEvent();

  @override
  List<Object> get props => [];
}

class DonationAmountChanged extends DonationEvent {
  final double amount;

  const DonationAmountChanged({required this.amount});

  @override
  List<Object> get props => [amount];
}

class ProcessDonation extends DonationEvent {
  const ProcessDonation();

  @override
  List<Object> get props => [];
}
