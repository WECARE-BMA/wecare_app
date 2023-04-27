import 'package:hive/hive.dart';
import 'package:wecare_app/models/donor_model.dart';

class DonorDBService {
  static const String _donorBoxName = 'donors';

  Future<void> addDonor(Donor donor) async {
    final box = await Hive.openBox<Donor>(_donorBoxName);
    await box.add(donor);
  }

  Future<List<Donor>> getDonors() async {
    final box = await Hive.openBox<Donor>(_donorBoxName);
    return box.values.toList();
  }

  Future<void> updateDonor(int index, Donor donor) async {
    final box = await Hive.openBox<Donor>(_donorBoxName);
    await box.putAt(index, donor);
  }

  Future<void> deleteDonor(int index) async {
    final box = await Hive.openBox<Donor>(_donorBoxName);
    await box.deleteAt(index);
  }
}
