import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wecare_app/blocs/history_bloc/history_event.dart';
import 'package:wecare_app/blocs/history_bloc/history_state.dart';
import 'package:wecare_app/service/donorsApiService.dart';
import 'package:wecare_app/service/kidsApiService.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final _donorsServiceProvider = DonorsServiceProvider();
  final _kidsServiceProvider = KidsServiceProvider();
  User? user = FirebaseAuth.instance.currentUser;

  List kidsList = [];
  List uKidList = [];
  List lKidList = [];

  HistoryBloc() : super(HistoryInitialState()) {
    on<GetKidsHistory>((event, emit) async {
      emit(HistoryLoadingState());
      final donor = await _donorsServiceProvider.getDonor(user!.uid);
      final kids = donor.kids;
      for (var x in kids!) {
        kidsList.add(x);
      }
      emit(HistorySuccessState(KidL: kidsList.toSet().toList()));
    });

    on<AddKidHistory>((event, emit) {
      emit(HistoryLoadingState());
      kidsList.add(event.kidList);

      emit(HistorySuccessState(KidL: kidsList));
    });
  }
}
