import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wecare_app/models/donor_model.dart';

class Need {
  String id;
  String name;
  int amount;
  String imageUrl;
  String? donor;
  bool isDonated;

  Need(
      {required this.id,
      required this.name,
      required this.amount,
      required this.imageUrl,
      this.donor,
      required this.isDonated});

  factory Need.fromJson(Map<String, dynamic> parsedJson) {
    return Need(
        id: parsedJson['id'],
        name: parsedJson.containsKey('category')
            ? parsedJson['category']
            : parsedJson['name'],
        amount: parsedJson['amount'].round(),
        imageUrl: parsedJson['imageUrl'],
        donor: parsedJson['donor'],
        isDonated: parsedJson['isDonated']);
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['amount'] = amount;
    json['imageUrl'] = imageUrl;
    json['donor'] = donor;
    json['isDonated'] = isDonated;
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
