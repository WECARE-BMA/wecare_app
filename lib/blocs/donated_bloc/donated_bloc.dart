import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_event.dart';
import 'package:wecare_app/blocs/donated_bloc/donated_state.dart';
import 'package:wecare_app/service/donorsApiService.dart';

class DonatedBloc extends Bloc<DonatedEvent, DonatedState> {
  final _donorsServiceProvider = DonorsServiceProvider();
  User? user = FirebaseAuth.instance.currentUser;
  List kidsList = [];
  List histList = [];

  DonatedBloc() : super(DonatedInitialState()) {
    on<GetKidsDonated>((event, emit) async {
      emit(DonatedLoadingState());
      final donor = await _donorsServiceProvider.getDonor(user!.uid);
      histList = donor.kids ?? [];

      emit(DonatedSuccessState(KidL: histList));
    });
  }
}
