import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wecare_app/models/need_model.dart';

class Kid {
  String id;
  String name;
  int age;
  String description;
  String imageUrl;
  List<Need> needs;
  bool isSaved;
  bool isUrgent;

  Kid(
      {required this.id,
      required this.name,
      required this.age,
      required this.description,
      required this.imageUrl,
      required this.needs,
      required this.isSaved,
      required this.isUrgent});

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
        isSaved: parsedJson['isSaved'],
        isUrgent: parsedJson.containsKey('isUrgent')
            ? parsedJson['isUrgent']
            : false);
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['age'] = age;
    json['description'] = description;
    json['imageUrl'] = imageUrl;
    json['needs'] = needs
        .map((e) => FirebaseFirestore.instance.collection('needs').doc(e.id));
    json['isSaved'] = isSaved;
    json['isUrgent'] = isUrgent;

    return json;
  }

  forDB() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['age'] = age;
    json['description'] = description;
    json['imageUrl'] = imageUrl;
    json['needs'] = needs.map((e) => e.toJson()).toList();
    json['isSaved'] = isSaved;
    json['isUrgent'] = isUrgent;

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

  int fullAmount() {
    List<int> amounts = needs.map((need) => need.amount).toList();
    int sum = amounts.reduce((int value, int element) => value + element);
    return sum;
  }

  int currentAmount() {
    List<int> amounts =
        needs.map((need) => need.isDonated == true ? need.amount : 0).toList();
    int sum = amounts.reduce((int value, int element) => value + element);
    return sum;
  }

  int noOfDonors() {
    return needs.map((need) => need.donor).toSet().toList().length;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Kid &&
        other.id == id &&
        other.name == name &&
        other.age == age &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.isSaved == isSaved &&
        other.isUrgent == isUrgent;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      age.hashCode ^
      description.hashCode ^
      imageUrl.hashCode ^
      isSaved.hashCode ^
      isUrgent.hashCode;
}
