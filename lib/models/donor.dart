import 'package:hive/hive.dart';
import 'package:wecare_app/models/kid_model.dart';

part 'donor.g.dart';

@HiveType(typeId: 0)
class Donor extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String image;
  @HiveField(3)
  String description;
  @HiveField(4)
  List<Kid>? kids;

  Donor({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    this.kids,
  });
}
