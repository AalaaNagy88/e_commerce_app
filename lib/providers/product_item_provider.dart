import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/store.dart';
import 'package:flutter/material.dart';

class ProductItem extends ChangeNotifier{
  List<ProductModel> productList=[];

  getAllProduct()async{
    Stream<QuerySnapshot>stream=Store().loadAllProducts();
    await for(QuerySnapshot item in stream){
      List<QueryDocumentSnapshot> lisData=item.docs;
      for(QueryDocumentSnapshot data in lisData){
        ProductModel product =
        ProductModel.fromJson(data.data(),data.id);
        productList.add(product);
      }
    }
    return productList;
  }
}