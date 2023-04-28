import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FirestorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future uploadFile(File file) async {
    try {
      // Create a unique filename for the uploaded file
      String filename = basename(file.path);

      // Get a reference to the Firebase Storage bucket
      final Reference ref = storage.ref().child(filename);

      // Upload the file to Firebase Storage
      UploadTask uploadTask = ref.putFile(file);

      // Get the download URL for the uploaded file
      String downloadURL = await (await uploadTask).ref.getDownloadURL();

      // Return the download URL
      return downloadURL;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }
}
