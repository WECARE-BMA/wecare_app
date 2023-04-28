import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_event.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_state.dart';
import 'package:wecare_app/models/kid_model.dart';
import 'package:wecare_app/service/donorsApiService.dart';
import 'package:wecare_app/service/kidsApiService.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final _donorsServiceProvider = DonorsServiceProvider();
  User? user = FirebaseAuth.instance.currentUser;

  List kidsList = [];
  List<Kid> savedList = [];

  SavedBloc() : super(SavedInitialState()) {
    on<GetKidsSaved>((event, emit) async {
      emit(SavedLoadingState());
      final donor = await _donorsServiceProvider.getDonor(user!.uid);
      final savedKids = donor.savedKids;
      for (var x in savedKids!) {
        savedList.add(x);
      }

      emit(SavedSuccessState(KidL: savedList));
    });
  }
}
