import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wecare_app/blocs/history_bloc/history_event.dart';
import 'package:wecare_app/blocs/history_bloc/history_state.dart';
import 'package:wecare_app/models/donor_model.dart';
import 'package:wecare_app/service/donorLocalDBService.dart';
import 'package:wecare_app/service/kidLocalDBService.dart';
import 'package:wecare_app/service/kidsApiService.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final _kidsServiceProvider = KidsServiceProvider();
  final KidDBService kidDBService = KidDBService();
  final DonorDBService donorDBService = DonorDBService();

  final User? currentUser = FirebaseAuth.instance.currentUser;

  List kidsList = [];
  List savedList = [];
  List needList = [];

  HistoryBloc() : super(HistoryInitialState()) {
    on<GetKidsHistory>((event, emit) async {
      emit(HistoryLoadingState());
      kidsList = await _kidsServiceProvider.getKids();
      emit(HistorySuccessState(KidL: kidsList));
    });

    on<GetSavedKid>((event, emit) async {
      emit(HistoryLoadingState());
      savedList = await _kidsServiceProvider.getKids();
      emit(HistorySuccessState(KidL: savedList));
    });

    on<AddKidHistory>((event, emit) {
      emit(HistoryLoadingState());
      kidsList.add(event.kidList);

      emit(HistorySuccessState(KidL: kidsList));
    });

    on<GetKids>(((event, emit) async {
      emit(HistoryLoadingState());
      final donors = await donorDBService.getDonors();

      late Donor donor;

      for (var d in donors) {
        if (d.id == currentUser!.uid) {
          donor = d;
        }
      }

      kidsList = donor.kids!;
    }));
  }
}
