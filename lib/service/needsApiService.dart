import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wecare_app/models/need_model.dart';

class NeedsServiceProvider {
  final CollectionReference _needsCollection =
      FirebaseFirestore.instance.collection('needs');

  Future<void> addNeed(Need need) async {
    await _needsCollection.add(need.toJson());
  }

  Future<List<Need>> getNeeds() async {
    final snapshot = await _needsCollection.get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return Need.fromJson(data);
    }).toList();
  }

  Future<Need> getNeed(String id) async {
    final doc = await _needsCollection.doc(id).get();
    final data = doc.data() as Map<String, dynamic>;
    data['id'] = doc.id;
    return Need.fromJson(data);
  }

  Future<void> updateNeed(Need need) async {
    await _needsCollection
        .doc(need.id)
        .update(need.toJson())
        .then((value) => print('Document Updated'));
  }
}
