import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wecare_app/models/kid_model.dart';
import 'package:wecare_app/service/donorsApiService.dart';
import 'package:wecare_app/service/kidsApiService.dart';

part 'kid_event.dart';
part 'kid_state.dart';

class KidBloc extends Bloc<KidEvent, KidState> {
  final _donorsServiceProvider = DonorsServiceProvider();
  final _kidsServiceProvider = KidsServiceProvider();
  User? user = FirebaseAuth.instance.currentUser;

  List uKidList = [];
  List lKidList = [];

  KidBloc() : super(KidInitial()) {
    on<GetKids>(
      (event, emit) async {
        emit(KidLoadingState());
        final kids = await _kidsServiceProvider.getKids();

        for (Kid k in kids) {
          if (k.isUrgent == true) {
            uKidList.add(k);
            lKidList.add(k);
          } else {
            lKidList.add(k);
          }
        }

        emit(KidSuccessState(uKidList: uKidList, lKidList: lKidList));
      },
    );
  }
}
