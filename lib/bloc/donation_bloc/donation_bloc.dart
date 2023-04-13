import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'donation_event.dart';
part 'donation_state.dart';

class DonationBloc {
  int _donationAmount = 0;
  final _donationStateController = StreamController<DonationState>();

  Stream<DonationState> get donationStateStream =>
      _donationStateController.stream;

  void _emitDonationState() {
    _donationStateController.sink
        .add(DonationUpdatedState(donationAmount: _donationAmount));
  }

  void handleDonationEvent(DonationEvent event) {
    if (event is IncrementDonationEvent) {
      _donationAmount += 10;
      _emitDonationState();
    } else if (event is DecrementDonationEvent) {
      if (_donationAmount > 0) {
        _donationAmount -= 10;
        _emitDonationState();
      } else if (event is SubmitDonationEvent) {}
    }

    void dispose() {
      _donationStateController.close();
    }
  }
}
