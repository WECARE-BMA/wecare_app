import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wecare_app/blocs/history_bloc/history_event.dart';
import 'package:wecare_app/blocs/history_bloc/history_state.dart';
import 'package:wecare_app/models/donor_model.dart';
import 'package:wecare_app/service/HiveService.dart';
import 'package:wecare_app/service/kidLocalDBService.dart';
import 'package:wecare_app/service/kidsApiService.dart';
import 'package:wecare_app/service/needLocalDBService.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final _kidsServiceProvider = KidsServiceProvider();
  final KidDBService kidDBService = KidDBService();
  final HiveService hiveService = HiveService();
  final NeedDBService needDBService = NeedDBService();

  final User? currentUser = FirebaseAuth.instance.currentUser;

  List kidsList = [];
  List needList = [];

  HistoryBloc() : super(HistoryInitialState()) {
    on<GetKidsHistory>((event, emit) async {
      emit(HistoryLoadingState());
      kidsList = await _kidsServiceProvider.getKids();
      emit(HistorySuccessState(KidL: kidsList));
    });

    on<AddKidHistory>((event, emit) {
      emit(HistoryLoadingState());

      emit(HistorySuccessState(KidL: kidsList));
    });

    on<GetKids>(((event, emit) async {
      emit(HistoryLoadingState());
      print(currentUser!.uid);

      final donorJson = await hiveService.read('donors', currentUser!.uid);

      kidsList = Donor.fromJson(donorJson).kids == null
          ? []
          : Donor.fromJson(donorJson).kids!;
      emit(KidsSuccessState(KidL: kidsList));
    }));
  }
}
