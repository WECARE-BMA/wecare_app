import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wecare_app/models/kid_model.dart';
import 'package:wecare_app/models/need_model.dart';
import 'package:wecare_app/service/needsApiService.dart';

class KidsServiceProvider {
  final _kidsCollection = FirebaseFirestore.instance.collection('kids');
  NeedsServiceProvider needsprovider = NeedsServiceProvider();

  Future addKids(Kid kid) async {
    _kidsCollection.add(kid.toJson()).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<void> updateKid(String id, Kid kid) async {
    await _kidsCollection.doc(id).update(kid.toJson());
  }

  Future<Kid?> getKid(String id) async {
    final doc = await _kidsCollection.doc(id).get();
    if (doc.exists) {
      return Kid.fromJson(doc.data()!);
    } else {
      return null;
    }
  }

  Future<List<Kid>> getKids() async {
    QuerySnapshot snapshot = await _kidsCollection.get();
    List<Kid> kids = [];
    for (final document in snapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      data['id'] = document.id;

      List<Map<String, dynamic>> needs = [];
      for (final e in data['needs']) {
        await needsprovider.getANeed(e.id);
      }
      data['needs'] = needs;

      kids.add(Kid.fromJson(data));
    }
    return kids;
  }
}
