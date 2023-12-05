import 'package:flutter/material.dart';
import 'package:flutter_image_crop/controllers/imageCropController.dart';
import 'package:get/get.dart';

class ImageCrop extends StatelessWidget {
  ImageCrop({Key? key}) : super(key: key);

  ImageCropController imgController = Get.put(ImageCropController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              imgController.getImageByCam();
            },
            child: Text(
              "Open Camera",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.blue), // Change the background color
              textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(
                  color: Colors.white, // Change the text color
                  fontSize: 16.0, // Change the font size
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.all(
                    18.0), // Adjust the padding to increase or decrease the button size
              ),
              // You can add more style properties as needed
            ),
          ),
        ),
      ),
    );
  }
}
