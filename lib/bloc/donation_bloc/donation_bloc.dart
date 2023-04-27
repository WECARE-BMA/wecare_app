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
    } else if (event is ProcessDonation) {
      yield DonationProcessingState();
      try {
        double? donationAmount = state.amount;

        await Future.delayed(const Duration(seconds: 2));

        yield DonationSuccessState();
      } catch (e) {
        yield DonationFailureState(error: e.toString());
      }
    }
  }
}
