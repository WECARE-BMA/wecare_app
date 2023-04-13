import 'package:wecare_app/models/kid_model.dart';

class Donor {
  final int id;
  final String firstName;
  final String lastName;
  final String image;
  final String description;
  final List<Kid> kids;

  
  Donor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.description,
    required this.kids,
  });

 factory Donor.fromJson(Map<String, dynamic> parsedJson) {
    final _kids = parsedJson['kids'].map((e) => Kid(id: e['id'], name: e['name'], age: e['age'], description: e['description'], image: e['image'], needs: e['needs']));
    return Donor(
      id: parsedJson['id'],
      firstName: parsedJson['first_name'],
      lastName: parsedJson['last_name'],
      image: parsedJson['image'],
      description: parsedJson['description'],
      kids: _kids,
    );
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
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

  static void add(Donor donor) {}
}