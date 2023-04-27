import 'package:hive/hive.dart';

part 'need.g.dart';

@HiveType(typeId: 2)
class Need extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int amount;
  @HiveField(3)
  String? imageUrl;
  @HiveField(4)
  String? donor;
  @HiveField(5)
  bool isDonated;

  Need({
    required this.id,
    required this.name,
    required this.amount,
    required this.imageUrl,
    this.donor,
    required this.isDonated,
  });

  // ...
}
