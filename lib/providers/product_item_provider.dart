import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends ChangeNotifier {
  List<ProductModel> productList = [];

  addProduct(ProductModel product) {
    productList.add(product);
    notifyListeners();
  }
  isInCart(ProductModel product,bool value){
    print(product.name);
    int index=productList.indexWhere((element) => element.name==product.name);
    if(index>=0){
      productList[index].addedTocart=value;
    }else{
      productList[index].addedTocart=!value;
    }
    notifyListeners();
  }
}
