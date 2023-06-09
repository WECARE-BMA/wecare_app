import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wecare_app/models/donor_model.dart';
import 'package:wecare_app/models/kid_model.dart';
import 'package:wecare_app/service/kidsApiService.dart';

class DonorsServiceProvider {
  KidsServiceProvider kidsprovider = KidsServiceProvider();

  final CollectionReference _donorsCollection =
      FirebaseFirestore.instance.collection('donors');

  Future<void> addDonor(Donor donor) async {
    await _donorsCollection.add(donor.toJson());
  }

  Future<List<Donor>> getDonors() async {
    final snapshot = await _donorsCollection.get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;

      final kids = data['kids'];
      List<Kid> kidsList = [];

      if (kids != null) {
        for (var n in kids) {
          final kid =
              kidsprovider.getKid(n.id).then((kid) => kidsList.add(kid));
        }
        data['kids'] = kidsList;
      } else {
        data['kids'] = kidsList;
      }

      return Donor.fromJson(data);
    }).toList();
  }

  Future<Donor> getDonor(String id) async {
    final queryDocs = await _donorsCollection.where('id', isEqualTo: id).get();
    ;
    final data = queryDocs.docs.first.data() as Map<String, dynamic>;

    final kids = data['kids'];
    List<Kid> kidsList = [];

    final savedKids = data['savedKids'];
    List<Kid> savedKidsL = [];

    if (kids != null && savedKids != null) {
      for (var n in kids) {
        final kid = await kidsprovider.getKid(n.id);
        kidsList.add(kid);
      }
      for (var n in savedKids) {
        final kid = await kidsprovider.getKid(n.id);
        savedKidsL.add(kid);
      }
    }

    data['kids'] = kidsList;
    data['savedKids'] = savedKidsL;

    return Donor.fromJson(data);
  }

  Future<void> updateDonor(Donor donor) async {
    final querySnapshot =
        await _donorsCollection.where('id', isEqualTo: donor.id).get();
    if (querySnapshot.docs.isNotEmpty) {
      final docId = querySnapshot.docs.first.id;
      await _donorsCollection.doc(docId).update(donor.toJson());
      print('Document Updated');
    }
  }

  // Future addDonor(Donor donor) async {
  //   _donorsCollection.add(donor.toJson()).then((DocumentReference doc) =>
  //       print('DocumentSnapshot added with ID: ${doc.id}'));
  // }

  // Future<void> updateDonor(String id, Donor donor) async {
  //   await _donorsCollection.doc(id).update(donor.toJson());
  // }

  // Future<Donor?> getDonor(String id) async {
  //   final doc = await _donorsCollection.doc(id).get();
  //   if (doc.exists) {
  //     var data = doc.data();
  //     data!['id'] = doc.id;

  //     List<Map<String, dynamic>> kids = [];
  //     for (final e in data['kids']) {
  //       await kidsprovider.getKid(e.id);
  //     }

  //     data['kids'] = kids;
  //     return Donor.fromJson(data);
  //   } else {
  //     return null;
  //   }
  // }

  // Future<List<Donor?>> getDonors() async {
  //   QuerySnapshot snapshot = await _donorsCollection.get();
  //   List<Donor> donors = [];
  //   for (final document in snapshot.docs) {
  //     Map<String, dynamic> data = document.data() as Map<String, dynamic>;
  //     data['id'] = document.id;

  //     List kids = [];
  //     for (final e in data['kids']) {
  //       final kid = await kidsprovider.getKid(e.id);
  //       kids.add(kid?.toJson());
  //     }

  //     data['kids'] = kids;

  //     print(data['kids']);
  //     donors.add(Donor.fromJson(data));
  //   }
  //   return donors;
  // }
}
