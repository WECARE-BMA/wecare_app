import 'package:equatable/equatable.dart';

abstract class DonationState extends Equatable {
  const DonationState();

  @override
  List<Object> get props => [];
}

class DonationInitial extends DonationState {}

class DonationAmountState extends DonationState {
  final double amount;

  const DonationAmountState({required this.amount});

  @override
  List<Object> get props => [amount];
}

class PaymentInfoState extends DonationState {
  final String paymentInfo;

  const PaymentInfoState({required this.paymentInfo});

  @override
  List<Object> get props => [paymentInfo];
}

class DonationProcessingState extends DonationState {}

class DonationSuccessState extends DonationState {}

class DonationFailureState extends DonationState {
  final String error;

  const DonationFailureState({required this.error});

  @override
  List<Object> get props => [error];
}
