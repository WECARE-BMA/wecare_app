import 'package:wecare_app/models/need_model.dart';

class Kid {
  final int id;
  final String name;
  final int age;
  final String description;
  final String image;
  final List<Need> needs;  

  Kid({
    required this.id,
    required this.name,
    required this.age,
    required this.description,
    required this.image,
    required this.needs,
  });

  factory Kid.fromJson(Map<String, dynamic> parsedJson) {
    final _needs = parsedJson['needs'].map((e) => Need(id: e['id'], name: e['name'], amount: e['amount'], image: e['image']));
    return Kid(
      id: parsedJson['id'],
      name: parsedJson['name'],
      age: parsedJson['age'],
      description: parsedJson['description'],
      image: parsedJson['image'],
      needs: _needs
    );
  }

  static List KidList(List kids) {
  List parsedKids = [];
  for (var i = 0; i < kids.length; i++) {
    parsedKids.add(Kid.fromJson(kids[i]));
  }
  return parsedKids;
  }

  static void add(Kid kid) {}
}
