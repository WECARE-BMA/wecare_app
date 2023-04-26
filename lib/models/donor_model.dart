import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wecare_app/models/kid_model.dart';

class Donor {
  String id;
  String name;
  String image;
  String description;
  List<Kid>? kids;

  Donor({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    this.kids,
  });

  factory Donor.fromJson(Map<String, dynamic> parsedJson) {
    return Donor(
      id: parsedJson['id'],
      name: parsedJson['name'],
      image: parsedJson['imageUrl'],
      description: parsedJson['description'],
      kids: parsedJson['kids'],
    );
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['image'] = image;
    json['description'] = description;
    json['kids'] = kids;
    return json;
  }

  static List DonorList(List donors) {
    List parsedDonors = [];
    for (var i = 0; i < donors.length; i++) {
      parsedDonors.add(Donor.fromJson(donors[i]));
    }
    return parsedDonors;
  }
}
