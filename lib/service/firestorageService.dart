import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirestorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload a file to a specified path
  Future<String> uploadFile(String path, File file) async {
    try {
      // Create a reference to the file path
      final Reference ref = _storage.ref().child(path);

      // Upload the file to the specified path
      final UploadTask uploadTask = ref.putFile(file);

      // Wait for the upload to complete and return the URL of the uploaded file
      final TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      // Handle any errors that occur during the upload process
      print('Error uploading file: $e');
      return 'Error uploading file: $e';
    }
  }
}
