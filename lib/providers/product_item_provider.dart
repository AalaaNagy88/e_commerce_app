import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/store.dart';
import 'package:flutter/material.dart';

class ProductItem extends ChangeNotifier {
  List<ProductModel> productList = [];

  addProduct(ProductModel product) {
    productList.add(product);
    notifyListeners();
  }
}
