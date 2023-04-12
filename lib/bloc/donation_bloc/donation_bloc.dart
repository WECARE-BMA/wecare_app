import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'donation_event.dart';
part 'donation_state.dart';

class DonationBloc extends Bloc<DonationEvent, DonationState> {
  DonationBloc() : super(DonationInitial()) {
    on<DonationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
