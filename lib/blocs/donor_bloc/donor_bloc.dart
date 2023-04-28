import 'package:bloc/bloc.dart';
import 'package:wecare_app/blocs/donor_bloc/donor_event.dart';
import 'package:wecare_app/blocs/donor_bloc/donor_state.dart';
import 'package:wecare_app/models/donor_model.dart';
import 'package:wecare_app/service/donorsApiService.dart';

class DonorBloc extends Bloc<DonorEvent, DonorState> {
  final _donorsServiceProvider = DonorsServiceProvider();
  late Donor donor;

  DonorBloc() : super(DonorInitialState()) {
    on<GetKidsDonor>((event, emit) async {
      emit(DonorLoadingState());
      final donors = await _donorsServiceProvider.getDonors();
       for (var donor in donors) {
        donor = (Donor.fromJson(donor as Map<String, dynamic>));
      }
      emit(DonorSuccessState(donors: donor));
    });
  }
}
