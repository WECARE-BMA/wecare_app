import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wecare_app/bloc/donation_bloc/donation_event.dart';
import 'package:wecare_app/bloc/donation_bloc/donation_state.dart';

class DonationBloc extends Bloc<DonationEvent, DonationState> {
  DonationBloc() : super(DonationInitial());

  @override
  Stream<DonationState> mapEventToState(
    DonationEvent event,
  ) async* {
    if (event is DonationAmountChanged) {
      yield DonationAmountState(amount: event.amount);
    } else if (event is PaymentInfoChanged) {
      yield PaymentInfoState(paymentInfo: event.paymentInfo);
    } else if (event is ProcessDonation) {
      yield DonationProcessingState();
      try {
        // Validate payment information and calculate donation amount
        String? paymentInfo = state.paymentInfo;
        double? donationAmount = state.amount;

        // Simulate processing the donation
        await Future.delayed(Duration(seconds: 2));

        // Notify the UI that the donation was successful
        yield DonationSuccessState();
      } catch (e) {
        // Notify the UI that the donation failed
        yield DonationFailureState(error: e.toString());
      }
    }
  }
}
