import 'package:hive/hive.dart';
import 'package:wecare_app/models/donor_model.dart';

class HiveService {
  final String boxName;

  HiveService({required this.boxName});

  Future<Box> get _box async => await Hive.openBox(boxName);

  Future<void> addData(String key, Donor value) async {
    final box = await _box;
    box.put(key, value.forDB());
  }

  Future<dynamic> getData(String key) async {
    final box = await _box;
    final donor = box.get(key);
    if (donor != null) {
      return Donor.fromJsonLDB(donor);
    } else {
      return null;
    }
  }

  Future<void> updateData(String key, dynamic value) async {
    final box = await _box;
    box.put(key, value);
  }

  Future<void> deleteData(String key) async {
    final box = await _box;
    box.delete(key);
  }

  // Future<Donor> getOneData(String id) async {
  //   final box = await _box;
  //   final donor = box.get(id);

  //   final kids = Map<String, dynamic>.from(donor['kids']);

  //   print(kids);

  //   List<Kid> kidsList = [];

  //   final savedKids = donor['savedKids'];
  //   List<Kid> savedKidsL = [];

  //   if (kids != null && savedKids != null) {
  //     for (var kid in kids['needs']) {
  //       List<Need> needs = [];
  //       for (var need in kid['needs']) {
  //         needs.add(Need.fromJson(Map<String, dynamic>.from(need)));
  //       }
  //       kid['needs'] = needs;
  //       kidsList.add(Kid.fromJson(kid));
  //     }
  //     for (var kid in savedKids) {
  //       List<Need> needs = [];
  //       for (var need in kid['needs']) {
  //         needs.add(Need.fromJson(Map<String, dynamic>.from(need)));
  //       }
  //       kid['needs'] = needs;
  //       kidsList.add(Kid.fromJson(kid));
  //     }
  //   }

  //   donor['kids'] = Kid.fromJson(kids);
  //   donor['savedKids'] = Kid.fromJson(savedKids);

  //   return Donor.fromJson(donor);
  // }
}
