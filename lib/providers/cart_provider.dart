import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> cart = [];

  addToCart(ProductModel product) {
    cart.add(product);
    notifyListeners();
  }

  removeFromCart(ProductModel product) {
    cart.remove(product);
    notifyListeners();
  }
}
