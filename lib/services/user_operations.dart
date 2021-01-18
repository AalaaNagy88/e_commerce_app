import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/models/order_model.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/product_item_provider.dart';
import 'package:e_commerce_app/providers/user_info_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserOperations with ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //user basic info operation
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

  updateUserData(context) {
    UserModel userModel =
        Provider.of<UserInfoProvider>(context, listen: false).user;
    firebaseFirestore
        .collection(kUserCollectionName)
        .doc(userModel.id)
        .update(userModel.toJson());
  }

//user cart operation
  updateItemCartQuantity(context, String itemid, int value) {
    UserModel user = Provider.of<UserInfoProvider>(context, listen: false).user;
    firebaseFirestore
        .collection(kCartCollectionName)
        .doc(user.cartId)
        .collection(kCartListCollectionName)
        .doc(itemid)
        .update({"quantity": value});
  }

  loadAllCartItems(context) {
    UserModel user = Provider.of<UserInfoProvider>(context, listen: false).user;
    if (user.cartId != "") {
      return firebaseFirestore
          .collection(kCartCollectionName)
          .doc(user.cartId)
          .collection(kCartListCollectionName)
          .snapshots()
          .listen((event) {
        Provider.of<CartProvider>(context, listen: false).cart = [];
        for (QueryDocumentSnapshot data in event.docs) {
          CartItemModel item = CartItemModel.fromJson(data.data());
          Provider.of<CartProvider>(context, listen: false).addToCart(item);
        }
      });
    }
  }

  // Stream<List<CartItemModel>> loadAllCartItemss(context) {
  //   UserModel user = Provider.of<UserInfoProvider>(context, listen: false).user;
  //   if (user.cartId != "") {
  //     return firebaseFirestore
  //         .collection(kCartCollectionName)
  //         .doc(user.cartId)
  //         .collection(kCartListCollectionName)
  //         .snapshots()
  //         .map((snapShot) => snapShot.docs
  //             .map((document) => CartItemModel.fromJson(document.data()))
  //             .toList());
  //   }
  //   return null;
  // }

  addItemToCart(CartItemModel cartItemModel, context) {
    UserModel userModel =
        Provider.of<UserInfoProvider>(context, listen: false).user;
    if (userModel.cartId == "") {
      DocumentReference ref =
          firebaseFirestore.collection(kCartCollectionName).doc();
      Provider.of<UserInfoProvider>(context, listen: false).user.cartId =
          ref.id;
      ref
          .collection(kCartListCollectionName)
          .add(cartItemModel.toJson())
          .then((value) {
        updateUserData(context);
        firebaseFirestore
            .collection(kCartCollectionName)
            .doc(userModel.cartId)
            .collection(kCartListCollectionName)
            .doc(value.id)
            .update({"id": value.id});
      });
    } else {
      firebaseFirestore
          .collection(kCartCollectionName)
          .doc(userModel.cartId)
          .collection(kCartListCollectionName)
          .add(cartItemModel.toJson())
          .then((value) {
        firebaseFirestore
            .collection(kCartCollectionName)
            .doc(userModel.cartId)
            .collection(kCartListCollectionName)
            .doc(value.id)
            .update({"id": value.id});
      });
    }
  }

  removeCartItem(context, String itemId) {
    UserModel userModel =
        Provider.of<UserInfoProvider>(context, listen: false).user;
    firebaseFirestore
        .collection(kCartCollectionName)
        .doc(userModel.cartId)
        .collection(kCartListCollectionName)
        .doc(itemId)
        .delete();
  }

  //user order operations
  addNewOrder(context, OrderModel order) {
    UserModel userModel =
        Provider.of<UserInfoProvider>(context, listen: false).user;
    if (userModel.orderId == "") {
      firebaseFirestore
          .collection(kOrderCollectionName)
          .add(order.toJson())
          .then((value) {
        firebaseFirestore
            .collection(kUserCollectionName)
            .doc(userModel.id)
            .update({"OrderId": value.id});
        Provider.of<UserInfoProvider>(context, listen: false).user.orderId =
            value.id;
        updateUserData(context);
      });
    } else {
      firebaseFirestore
          .collection(kOrderCollectionName)
          .doc(userModel.orderId)
          .update({"items": order.items});
    }
  }

  Stream<DocumentSnapshot> laodCurrentUserOrder(context) {
    UserModel userModel =
        Provider.of<UserInfoProvider>(context, listen: false).user;
    return firebaseFirestore
        .collection(kOrderCollectionName)
        .doc(userModel.orderId)
        .snapshots();
  }

  truncateCartAfterOrder(context) {
    UserModel userModel =
        Provider.of<UserInfoProvider>(context, listen: false).user;
    firebaseFirestore
        .collection(kCartCollectionName)
        .doc(userModel.cartId)
        .collection(kCartListCollectionName)
        .snapshots()
        .listen((event) {
      for (QueryDocumentSnapshot data in event.docs) {
        CartItemModel item = CartItemModel.fromJson(data.data());
        Provider.of<CartProvider>(context, listen: false).removeFromCart(item);
        ProductModel currentproduct = ProductModel();
        for (ProductModel product
            in Provider.of<ProductItem>(context, listen: false).productList) {
          if (product.name == item.name) {
            currentproduct.name = product.name;
            product.addedTocart = false;
          }
        }
        removeCartItem(context, item.id);
        print(Provider.of<CartProvider>(context, listen: false).cart.length);
      }
    });
  }
}
