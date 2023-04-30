import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wecare_app/models/kid_model.dart';
import 'package:wecare_app/models/need_model.dart';
import 'package:wecare_app/service/needsApiService.dart';

class KidsServiceProvider {
  final CollectionReference _kidsCollection =
      FirebaseFirestore.instance.collection('kids');
  NeedsServiceProvider _needsProvider = NeedsServiceProvider();

  Future<void> addKid(Kid kid) async {
    await _kidsCollection.add(kid.toJson());
  }

  Future<List> getKids() async {
    final snapshot = await _kidsCollection.get();
    final futures = snapshot.docs.map((doc) async {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      final needs = data['needs'];
      List<Need> needsList = [];

      for (var n in needs) {
        final need = await _needsProvider.getNeed(n.id);
        needsList.add(need);
      }

      data['needs'] = needsList;
      return Kid.fromJson(data);
    }).toList();

    return Future.wait(futures);
  }

  Future<Kid> getKid(String id) async {
    final doc = await _kidsCollection.doc(id).get();
    final data = doc.data() as Map<String, dynamic>;
    data['id'] = doc.id;
    final needs = data['needs'];
    List<Need> needsList = [];

    for (var n in needs) {
      final need = await _needsProvider.getNeed(n.id);
      needsList.add(need);
    }

    data['needs'] = needsList;
    return Kid.fromJson(data);
  }

  Future<void> updateKid(Kid kid) async {
    await _kidsCollection
        .doc(kid.id)
        .update(kid.toJson())
        .then((value) => print('Document Updated'));
  }
}
