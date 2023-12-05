import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class ImageCropController extends GetxController {
  RxString imagePath = ''.obs;
  RxString base64ImageForLiveCapture = ''.obs;

  Future getImageByCam() async {
    final ImagePicker imageCam = ImagePicker();
    final image = await imageCam.pickImage(source: ImageSource.camera);

    if (image != null) {
      imagePath.value = image.path.toString();
      final List<int> originalBytes = await image.readAsBytes();
      final img.Image originalImage =
          img.decodeImage(Uint8List.fromList(await image.readAsBytes()))!;

      // Print the original image size
      print('Original Image Size: ${originalBytes.length} bytes');

      // Resize the image using fast_image_resizer package
      final img.Image resizedImage = img.copyResize(originalImage, width: 150);

      // Convert resized image to bytes
      final List<int> resizedBytes = img.encodePng(resizedImage);

      // Print the resized image size
      print('Resized Image Size: ${resizedBytes.length} bytes');

      // Convert bytes to base64
      String base64Data = base64Encode(resizedBytes);

      base64ImageForLiveCapture.value = 'data:image/png;base64,' + base64Data;

      // Print the base64 image data for testing
      // print("Base64 Image Data: ${base64ImageForLiveCapture.value}");
    }
  }
}
