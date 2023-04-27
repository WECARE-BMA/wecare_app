import 'package:hive/hive.dart';
import 'package:wecare_app/models/need.dart';

part 'kid.g.dart';

@HiveType(typeId: 1)
class Kid extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int age;
  @HiveField(3)
  String description;
  @HiveField(4)
  String imageUrl;
  @HiveField(5)
  List<Need>? needs;

  Kid({
    required this.id,
    required this.name,
    required this.age,
    required this.description,
    required this.imageUrl,
    required this.needs,
  });

  // ...
}
