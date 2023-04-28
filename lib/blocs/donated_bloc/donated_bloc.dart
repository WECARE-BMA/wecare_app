import 'package:bloc/bloc.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_event.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_state.dart';
import 'package:wecare_app/service/kidsApiService.dart';

class DonatedBloc extends Bloc<DonatedEvent, DonatedState> {
  final _kidsServiceProvider = KidsServiceProvider();
  List kidsList = [];
  List histList = [];

  DonatedBloc() : super(DonatedInitialState()) {

    on<GetKidsDonated>((event, emit) async {
      emit(DonatedLoadingState());
      kidsList = await _kidsServiceProvider.getKids();
      for (var kid in kidsList) {
        int sum = 0;
        for (var need in kid.needs) {  
          if (need.isDonated == true)
          {
            sum = sum + 1;
          }
        }
        if (sum > 0){
          histList.add(kid);
        }
      }
      emit(DonatedSuccessState(KidL: histList));
    });

  }
}
