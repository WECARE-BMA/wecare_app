import 'package:wecare_app/models/need_model.dart';

class Kid {
  final int id;
  final String name;
  final int age;
  final String description;
  final String image;
  final Need needs;  

  Kid({
    required this.id,
    required this.name,
    required this.age,
    required this.description,
    required this.image,
    required this.needs,
  });
}
