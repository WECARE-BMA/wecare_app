import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wecare_app/models/kid_model.dart';

class KidServiceProvider {
  List kidsJson = [
    {
      "id": 1,
      "name": "John",
      "age": 8,
      "description": "A happy kid who loves to play soccer",
      "image": "https://example.com/images/john.jpg",
      "needs": [
        {
          "id": 1,
          "name": "Soccer ball",
          "amount": 25.99,
          "image": "https://example.com/images/soccer_ball.jpg"
        },
        {
          "id": 2,
          "name": "Soccer shoes",
          "amount": 45.99,
          "image": "https://example.com/images/soccer_shoes.jpg"
        }
      ]
    },
    {
      "id": 2,
      "name": "Jane",
      "age": 10,
      "description": "A creative kid who loves to draw and paint",
      "image": "https://example.com/images/jane.jpg",
      "needs": [
        {
          "id": 3,
          "name": "Sketchbook",
          "amount": 10.99,
          "image": "https://example.com/images/sketchbook.jpg"
        },
        {
          "id": 4,
          "name": "Colored pencils",
          "amount": 12.99,
          "image": "https://example.com/images/colored_pencils.jpg"
        }
      ]
    },
    {
      "id": 2,
      "name": "Jane",
      "age": 10,
      "description": "A creative kid who loves to draw and paint",
      "image": "https://example.com/images/jane.jpg",
      "needs": [
        {
          "id": 3,
          "name": "Sketchbook",
          "amount": 10.99,
          "image": "https://example.com/images/sketchbook.jpg"
        },
        {
          "id": 4,
          "name": "Colored pencils",
          "amount": 12.99,
          "image": "https://example.com/images/colored_pencils.jpg"
        }
      ]
    },
  ];
  final firestore = FirebaseFirestore.instance;

  Future getKids() async {
    final data = await firestore.collection("needs").get();
    for (var doc in data.docs) {
      print(doc.data());
    }
  }

  Future addKids(amount, imageUrl, name, donorId, isDonated) async {
    final need = <String, dynamic>{
      "amount": amount,
      "imageUrl": imageUrl,
      "name": name,
      "donorId": donorId,
      "isDonated": isDonated
    };

    firestore.collection('needs').add(need).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
