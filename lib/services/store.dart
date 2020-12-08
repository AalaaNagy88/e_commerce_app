import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/providers/image_picker_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store{
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  Future<String> uploadImage(context) async {
    try {
      File _image = Provider
          .of<ImagePickerProvider>(context, listen: false)
          .image;
      String fileName = p.basename(_image.path);
      firebase_storage.Reference ref =
      firebase_storage.FirebaseStorage.instance.ref().child("/$fileName");
      firebase_storage.UploadTask uploadTask =
      ref.putFile(_image);
      firebase_storage.TaskSnapshot taskSnapshot = await uploadTask
          .whenComplete(() => {});
      return await taskSnapshot.ref.getDownloadURL();
    }catch(e){
      print(e.message);
      return null;
    }
  }
  void addNewProduct(ProductModel product){
    firebaseFirestore.collection(kProductsCollectionName).add(product.toJson());
  }
  Stream<QuerySnapshot> loadAllProducts(){
    return firebaseFirestore.collection(kProductsCollectionName).snapshots();
  }
}