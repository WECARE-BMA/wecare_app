import 'package:hive/hive.dart';
import 'package:wecare_app/models/need_model.dart';

class NeedService {
  static const String _needBoxName = 'needs';

  Future<void> addNeed(Need need) async {
    final box = await Hive.openBox<Need>(_needBoxName);
    await box.add(need);
  }

  Future<List<Need>> getNeeds() async {
    final box = await Hive.openBox<Need>(_needBoxName);
    return box.values.toList();
  }

  Future<void> updateNeed(int index, Need need) async {
    final box = await Hive.openBox<Need>(_needBoxName);
    await box.putAt(index, need);
  }

  Future<void> deleteNeed(int index) async {
    final box = await Hive.openBox<Need>(_needBoxName);
    await box.deleteAt(index);
  }
}
