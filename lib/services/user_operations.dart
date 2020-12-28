import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/user_info_provider.dart';
import 'package:provider/provider.dart';

class UserOperations {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  addUser(UserModel user) {
    firebaseFirestore.collection(kUserCollectionName).add(user.toJson()).then(
        (value) => firebaseFirestore
            .collection(kUserCollectionName)
            .doc(value.id)
            .update({"id": value.id}));
  }

  getCurrentUserInfo(email, context) {
    firebaseFirestore
        .collection(kUserCollectionName)
        .snapshots()
        .listen((event) {
      for (QueryDocumentSnapshot data in event.docs) {
        Map<String, dynamic> current = data.data();
        if (current["email"] == email) {
          UserModel user = UserModel.fromJson(current);
          Provider.of<UserInfoProvider>(context, listen: false)
              .loadUserInfo(user);
        }
      }
    });
  }

  updateUserData(UserModel userModel) {
    print(userModel.toJson());
    firebaseFirestore
        .collection(kUserCollectionName)
        .doc(userModel.id)
        .update(userModel.toJson());
  }

  addItemToCart(CartItemModel cartItemModel, context) {
    UserModel userModel =
        Provider.of<UserInfoProvider>(context, listen: false).user;
    if (userModel.cartId == "") {
      DocumentReference ref =
          firebaseFirestore.collection(kCartCollectionName).doc();
      Provider.of<UserInfoProvider>(context, listen: false).user.cartId =
          ref.id;
      updateUserData(userModel);
      ref.collection(kCartListCollectionName).add(cartItemModel.toJson());
    } else {
      firebaseFirestore
          .collection(kCartCollectionName)
          .doc(userModel.cartId)
          .collection(kCartListCollectionName)
          .add(cartItemModel.toJson());
    }
  }
  loadAllCartItems(context,userModel){
    try {
      firebaseFirestore
          .collection(kCartCollectionName)
          .doc(userModel.cartId)
          .collection(kCartListCollectionName).snapshots().listen((event) {
        Provider
            .of<CartProvider>(context, listen: false)
            .cart = [];
        for (QueryDocumentSnapshot data in event.docs) {
          CartItemModel item =
          CartItemModel.fromJson(data.data());
          Provider.of<CartProvider>(context, listen: false).addToCart(
              item, context);
        }
      });
    }catch(e){
      Provider
          .of<CartProvider>(context, listen: false)
          .cart = [];
    }
  }
}
