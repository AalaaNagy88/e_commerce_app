import 'package:e_commerce_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier{
  UserModel user;

  loadUserInfo(UserModel user){
    this.user=user;
    print(this.user.name);
    notifyListeners();
  }
}