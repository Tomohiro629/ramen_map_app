import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ramen_map_app/service/image_cropper_service.dart';

final imagePickerServiceProvider =
    ChangeNotifierProvider<ImagePickerService>((ref) {
  return ImagePickerService(ref.read);
});

class ImagePickerService extends ChangeNotifier {
  final Reader reader;
  ImagePickerService(this.reader);
  final _picker = ImagePicker();
  File? imagePath;

  Future<void> takeCamera() async {
    final picekdfile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (picekdfile != null) {
      File? img = File(picekdfile.path);
      img = await reader(imageCropperServiceProvider).cropImage(imageFile: img);
      imagePath = img;
    }
    notifyListeners();
  }

  Future<void> takeGallery() async {
    final picekdfile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (picekdfile != null) {
      File? img = File(picekdfile.path);
      img = await reader(imageCropperServiceProvider).cropImage(imageFile: img);
      imagePath = img;
    }
    notifyListeners();
  }
}
