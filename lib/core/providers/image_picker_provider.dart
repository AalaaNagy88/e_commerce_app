import 'dart:io';

import 'package:flutter/material.dart';
class ImagePickerProvider extends ChangeNotifier{
  File image;
  pickImage(File value){
    image=value;
    notifyListeners();
  }
}