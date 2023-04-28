import 'package:wecare_app/db/database_repo.dart';
import 'package:wecare_app/models/donor_model.dart';

class DonorDBService {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }

  saveDonor(Donor donor) async {
    final x = await _repository!.insertData('donor', donor.toJson());
    return x;
  }

  readDonor() async {
    return await _repository?.readData('donor');
  }

  readOneDonor(donorId) async {
    return await _repository?.readDataId('donor', donorId);
  }

  deleteDonor(donorId) async {
    return await _repository!.deleteData('donor', donorId);
  }
}
