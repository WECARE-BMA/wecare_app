import 'package:hive/hive.dart';
import 'package:wecare_app/models/kid_model.dart';

class KidService {
  static const String _kidBoxName = 'kids';

  Future<void> addKid(Kid kid) async {
    final box = await Hive.openBox<Kid>(_kidBoxName);
    await box.add(kid);
  }

  Future<List<Kid>> getKids() async {
    final box = await Hive.openBox<Kid>(_kidBoxName);
    return box.values.toList();
  }

  Future<void> updateKid(int index, Kid kid) async {
    final box = await Hive.openBox<Kid>(_kidBoxName);
    await box.putAt(index, kid);
  }

  Future<void> deleteKid(int index) async {
    final box = await Hive.openBox<Kid>(_kidBoxName);
    await box.deleteAt(index);
  }
}
