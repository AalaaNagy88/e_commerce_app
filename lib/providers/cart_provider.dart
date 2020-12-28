import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/services/user_operations.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModel> cart = [];
  UserOperations _userOperations=UserOperations();

  addToCart(CartItemModel product,context) {
    cart.add(product);
    _userOperations.addItemToCart(product,context);
    notifyListeners();
  }

  removeFromCart(CartItemModel product) {
    cart.remove(product);
    notifyListeners();
  }
}
