import 'package:hive/hive.dart';
import 'package:wecare_app/models/donor_model.dart';

import 'package:hive/hive.dart';

class HiveService {
  Future<void> create(
      String boxName, String key, Map<String, dynamic> json) async {
    var box = await Hive.openBox(boxName);
    await box.put(key, json);
    print('obj added YYY');
  }

  Future<Map<String, dynamic>> read(String boxName, String key) async {
    var box = await Hive.openBox(boxName);
    return box.get(key);
  }

  Future<void> update(
      String boxName, String key, Map<String, dynamic> json) async {
    var box = await Hive.openBox(boxName);
    await box.put(key, json);
  }

  Future<void> delete(String boxName, String key) async {
    var box = await Hive.openBox(boxName);
    await box.delete(key);
  }
}
