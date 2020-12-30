import 'package:e_commerce_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier {
  UserModel user;

  loadUserInfo(UserModel userModel) {
    user = UserModel(
        email: userModel.email,
        name: userModel.name,
        cartId: userModel.cartId,
        id: userModel.id,
        address: userModel.address,
        orderId: userModel.orderId,
        phone: userModel.phone);
    notifyListeners();
  }
}
