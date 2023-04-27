import 'package:bloc/bloc.dart';
import 'package:wecare_app/blocs/history_bloc/history_event.dart';
import 'package:wecare_app/blocs/history_bloc/history_state.dart';
import 'package:wecare_app/service/kidsApiService.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final _kidsServiceProvider = KidsServiceProvider();
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

  }
}
