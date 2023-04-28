import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wecare_app/models/kid_model.dart';

class Donor {
  String id;
  String name;
  String image;
  String description;
  List<Kid>? kids;
  List<dynamic>? savedKids;

  Donor(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      this.kids,
      this.savedKids});

  factory Donor.fromJson(Map<String, dynamic> parsedJson) {
    return Donor(
        id: parsedJson['id'],
        name: parsedJson['name'],
        image: parsedJson['image'],
        description: parsedJson['description'],
        kids: parsedJson['kids'],
        savedKids:
            parsedJson.containsKey('savedKids') ? parsedJson['savedKids'] : []);
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['image'] = image;
    json['description'] = description;
    json['kids'] = kids!
        .map((e) => FirebaseFirestore.instance.collection('kids').doc(e.id));
    json['savedKids'] = savedKids!
        .map((e) => FirebaseFirestore.instance.collection('kids').doc(e.id));
    ;
    return json;
  }

  forDB() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['image'] = image;
    json['description'] = description;
    json['kids'] = kids?.map((e) => e.forDB()).toList();
    json['savedKids'] = savedKids?.map((e) => e.forDB()).toList();

    return json;
  }

  static List DonorList(List donors) {
    List parsedDonors = [];
    for (var i = 0; i < donors.length; i++) {
      parsedDonors.add(Donor.fromJson(donors[i]));
    }
    return parsedDonors;
  }

  int getCauses() {
    int count = 0;
    if (kids != null) {
      for (final kid in kids!) {
        for (final need in kid.needs) {
          if (need.donor == id) {
            count++;
          }
        }
      }
    }
    return count;
  }

  String getTotalDonatedAmount() {
    int total = 0;
    if (kids != null) {
      for (final kid in kids!) {
        for (final need in kid.needs) {
          if (need.donor == id) {
            total += need.amount;
          }
        }
      }
    }
    return formatNumber(total);
  }

  String formatNumber(num number) {
    if (number >= 1000000000) {
      return '${(number / 1000000000).toStringAsFixed(1)}B';
    } else if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    } else {
      return number.toString();
    }
  }
}
