import 'package:bloc/bloc.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_event.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_state.dart';
import 'package:wecare_app/service/kidsApiService.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final _kidsServiceProvider = KidsServiceProvider();
  List kidsList = [];
  List savedList = [];

  SavedBloc() : super(SavedInitialState()) {

    on<GetKidsSaved>((event, emit) async {
      emit(SavedLoadingState());
      kidsList = await _kidsServiceProvider.getKids();
      for (var kid in kidsList) {  
        if (kid.isSaved == true){
          savedList.add(kid);
        }
      }
      emit(SavedSuccessState(KidL: savedList));
    });

  }
}
