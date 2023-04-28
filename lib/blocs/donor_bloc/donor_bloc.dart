import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wecare_app/blocs/donor_bloc/donor_event.dart';
import 'package:wecare_app/blocs/donor_bloc/donor_state.dart';
import 'package:wecare_app/db/hive_service.dart';
import 'package:wecare_app/models/donor_model.dart';
import 'package:wecare_app/service/donorsApiService.dart';

class DonorBloc extends Bloc<DonorEvent, DonorState> {
  final _donorsServiceProvider = DonorsServiceProvider();
  HiveService hiveService = HiveService(boxName: 'donor');
  User? user = FirebaseAuth.instance.currentUser;

  DonorBloc() : super(DonorInitialState()) {
    on<GetKidsDonor>((event, emit) async {
      emit(DonorLoadingState());
      final donor = await _donorsServiceProvider.getDonor(user!.uid);
      await hiveService.addData("1", donor );
      if (user != null) {
        final donor = await hiveService.getData("1");
        if (donor != null) {
          emit(DonorSuccessState(donors: donor));
        } else {
          emit(DonorFailState(message: 'Failed to load donor'));
        }
      } else {
        emit(DonorFailState(message: 'User is null'));
      }
    });
  }
}
