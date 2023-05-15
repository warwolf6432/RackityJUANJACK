import 'dart:io';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImagesController extends GetxController {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  

  ImagesController();

  Future<String?> uploadImage(File? image, String userId ) async {
    if (image == null) {
      return null;
    }

    try {
      // Create a reference to the image in Firebase Storage
      final ref = _storage.ref().child('images/${userId}/${image.path}');

      // Upload the image
      await ref.putFile(image);

      // Get the download URL for the image
      final url = await ref.getDownloadURL();

      // Return the download URL
      return url;
    } catch (e) {
      // Handle the error
      print(e);
      return null;
    }
  }
}