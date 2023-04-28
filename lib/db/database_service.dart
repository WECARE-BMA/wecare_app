import 'package:wecare_app/db/database_repo.dart';
import 'package:wecare_app/models/donor_model.dart';

class Service {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }

  saveDonor(Donor donor) async {
    return await _repository!.insertData('donor', donor.toJson());
  }

  readDonor() async {
    return await _repository!.readData('donor');
  }

  deleteDonor(dispatchId) async {
    return await _repository!.deleteData('donor', dispatchId);
  }
}
