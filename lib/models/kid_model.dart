import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wecare_app/models/need_model.dart';

class Kid {
  String id;
  String name;
  int age;
  String description;
  String imageUrl;
  List<Need> needs;

  Kid({
    required this.id,
    required this.name,
    required this.age,
    required this.description,
    required this.imageUrl,
    required this.needs,
  });

  factory Kid.fromJson(Map<String, dynamic> parsedJson) {
    return Kid(
      id: parsedJson['id'],
      name: parsedJson['name'],
      age: parsedJson['age'],
      description: parsedJson['description'],
      imageUrl: parsedJson.containsKey('image')
          ? parsedJson['image']
          : parsedJson['imageUrl'],
      needs: parsedJson['needs'],
    );
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['age'] = age;
    json['description'] = description;
    json['imageUrl'] = imageUrl;
    json['needs'] = needs;

    return json;
  }

  static List<Kid>? kidList(List kids) {
    List<Kid> parsedKids = [];
    for (var i = 0; i < kids.length; i++) {
      parsedKids.add(Kid.fromJson(kids[i]));
    }
    return parsedKids;
  }

  static void add(Kid kid) {}

  double fullAmount(){
    List amounts = needs.map((need) => need.amount).toList();
    return amounts.reduce((value, element) => value + element);
  }

  double currentAmount(){
    List amounts = needs.map((need) => need.isDonated == true ? need.amount : 0).toList();
    return amounts.reduce((value, element) => value + element);
  }

  int noOfDonors(){
    return needs.map((need) => need.donor).toSet().toList().length;
  }
}
