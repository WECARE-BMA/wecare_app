import 'package:wecare_app/models/need_model.dart';

class Kid {
  final String id;
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
    return Kid(
      id: parsedJson['id'],
      name: parsedJson['name'],
      age: parsedJson['age'],
      description: parsedJson['description'],
      image: parsedJson.containsKey('image')
          ? parsedJson['image']
          : parsedJson['imageUrl'],
      needs: (parsedJson['needs'] as List)
          .map((needJson) => Need.fromJson(needJson))
          .toList(),
    );
  }

  toJson() {
    Map<String, dynamic> json = {
      'name': name,
      'age': age,
      'description': description,
      'image': image,
      'needs': needs.map((e) => "needs/${e.id}")
    };

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
}
