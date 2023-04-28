import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wecare_app/models/kid_model.dart';

class Donor {
  String id;
  String name;
  String image;
  String description;
  List<Kid>? kids;

  Donor({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    this.kids,
  });

  factory Donor.fromJson(Map<String, dynamic> parsedJson) {
    return Donor(
      id: parsedJson['id'],
      name: parsedJson['name'],
      image: parsedJson['image'],
      description: parsedJson['description'],
      kids: parsedJson['kids'],
    );
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['image'] = image;
    json['description'] = description;
    json['kids'] = kids;
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
