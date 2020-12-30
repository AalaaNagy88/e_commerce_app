import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModel> cart = [];

  addToCart(CartItemModel product) {
    cart.add(product);
    notifyListeners();
  }

  removeFromCart(CartItemModel product) {
    cart.remove(product);
    notifyListeners();
  }
}
