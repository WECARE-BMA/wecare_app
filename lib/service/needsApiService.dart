import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wecare_app/models/donor_model.dart';
import 'package:wecare_app/models/kid_model.dart';
import 'package:wecare_app/models/need_model.dart';

class NeedsServiceProvider {
  final _needsCollection = FirebaseFirestore.instance.collection('needs');

  Future<List<Need>> getNeeds() async {
    final data = await _needsCollection.get();
    List<Need> needs = [];
    for (var doc in data.docs) {
      var need = doc.data();
      need['id'] = doc.id;
      final donorRef = need['donor'];
      final donorSnapshot = await donorRef.get();
      final donorData = donorSnapshot.data();

      donorData['id'] = donorRef.id;
      need['donor'] = Donor.fromJson(donorData);
      needs.add(Need.fromJson(need));
    }
    return needs;
  }

  Future<Need> getNeed(String id) async {
    final docRef = _needsCollection.doc(id);
    final doc = await docRef.get();
    final data = doc.data();

    final donorDocRef = await data!['donor'].get();
    final donorData = donorDocRef.data() as Map<String, dynamic>;
    donorData['id'] = donorDocRef.id;
    final donor = Donor.fromJson(donorData);

    data['id'] = docRef.id;
    data['donor'] = donor;

    return Need.fromJson(data);
  }

  Future updateNeed(Need need) async {
    final data = need.toJson();
    final donorId = need.donor?.id;
    final newReference =
        FirebaseFirestore.instance.collection('donors').doc(donorId);
    data['donor'] = newReference;

    final docRef = _needsCollection.doc(need.id);
    return docRef.update(data).then(
        (value) => print("Document Updated Successfully"),
        onError: (e) => print("Error updating document: $e"));
  }

  // Future addNeed(Need need) async {
  //   final data = need.toJson();

  //   _needsCollection.add(data).then((DocumentReference doc) =>
  //       print('DocumentSnapshot added with ID: ${doc.id}'));
  // }
}
