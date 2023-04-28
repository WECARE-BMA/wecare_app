import 'package:bloc/bloc.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_event.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_state.dart';
import 'package:wecare_app/service/kidsApiService.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final _kidsServiceProvider = KidsServiceProvider();
  List kidsList = [];
  List needList = [];

  SavedBloc() : super(SavedInitialState()) {
    on<GetKidsSaved>((event, emit) async {
      emit(SavedLoadingState());
      kidsList = await _kidsServiceProvider.getKids();
      emit(SavedSuccessState(KidL: kidsList));
    });

    on<AddKidSaved>((event, emit) {
      emit(SavedLoadingState());
      kidsList.add(event.kidList);

      emit(SavedSuccessState(KidL: kidsList));
    });
  }
}
