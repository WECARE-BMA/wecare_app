import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

  Future getKids() async {
    final snapshot = await _kidsCollection.get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      final needs = data['needs'];
      List<Need> needsList = [];

      for (var n in needs) {
        final need =
            _needsProvider.getNeed(n.id).then((need) => needsList.add(need));
      }

      data['needs'] = needsList;
      return Kid.fromJson(data);
    }).toList();
  }

  Future<Kid> getKid(String id) async {
    final doc = await _kidsCollection.doc(id).get();
    final data = doc.data() as Map<String, dynamic>;
    data['id'] = doc.id;
    final needs = data['needs'];
    List<Need> needsList = [];

    for (var n in needs) {
      final need =
          _needsProvider.getNeed(n.id).then((need) => needsList.add(need));
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
