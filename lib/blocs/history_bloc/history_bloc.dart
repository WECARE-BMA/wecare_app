import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:wecare_app/blocs/history_bloc/history_event.dart';
import 'package:wecare_app/blocs/history_bloc/history_state.dart';
import 'package:wecare_app/models/kid_model.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final _apiServiceProvider = ApiServiceProvider();
  final _service = Service();
  List kidsList = [];
  int index = 0;
  num price = 0;

  HistoryBloc() : super(HistoryInitialState()) {
    
    on<GetKidsHistory>((event, emit) async {
      final kids = await _service.read();
      print(kids);
      for (var kid in kids) {
        kidsList.add(Kid.fromJson(kid));
      }

      // emit(HistoryLoadingState());
      emit(HistorySuccessState(Kid: kidsList));
    });

    on<AddKidHistory>((event, emit) {
      emit(HistoryLoadingState());
      // cartKids.add(event.cartKid);
      _service.saveKid(event.kidList);
      
      emit(HistorySuccessState(Kid: kidsList));
    });

    on<RemoveKidHistory>((event, emit) {
      emit(HistoryLoadingState());
      kidsList.removeAt(event.index);
      _service.deleteKid(event.kidList);
      emit(HistorySuccessState(Kid: kidsList));
    });
  }
}
