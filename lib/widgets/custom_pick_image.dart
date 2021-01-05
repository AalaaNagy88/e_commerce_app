import 'dart:io';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/providers/image_picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CustomPickImage extends StatelessWidget {
  final IconData icon;
  final bool fromCamera;

  const CustomPickImage({Key key, @required this.icon, this.fromCamera = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
        icon: Icon(
          icon,
          color: kButtonShadow,
          size: 50,
        ),
        onPressed: () async {
          Provider.of<ImagePickerProvider>(context, listen: false)
              .pickImage(await getImage());
        },
      ),
    ]);
  }

  Future<File> getImage() async {
    final picker = ImagePicker();
    final pickedFile = fromCamera
        ? await picker.getImage(source: ImageSource.camera)
        : await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
