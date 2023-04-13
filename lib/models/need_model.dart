import 'package:wecare_app/models/donor_model.dart';

class Need {
  final int id;
  final String name;
  final int amount;
  final String image;
  final Donor donor;
  
  Need({
    required this.id,
    required this.name,
    required this.amount,
    required this.image,
    required this.donor,
  });

 factory Need.fromJson(Map<String, dynamic> parsedJson) {
  return Need(
    id: parsedJson['id'],
    name: parsedJson.containsKey('category') ? parsedJson['category'] : parsedJson['name'],
    amount: parsedJson['amount'].round(),
    image: parsedJson['image'],
    donor: parsedJson['donor'],
  );
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['amount'] = amount;
    json['image'] = image;
    json['donor'] = donor;
    return json;
  }

  static List NeedList(List needs) {
  List parsedNeeds = [];
  for (var i = 0; i < needs.length; i++) {
    parsedNeeds.add(Need.fromJson(needs[i]));
  }
  return parsedNeeds;
  }

  static void add(Need need) {}
}