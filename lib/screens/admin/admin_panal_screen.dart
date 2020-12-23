import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/providers/product_item_provider.dart';
import 'package:e_commerce_app/screens/admin/add_new_product_screen.dart';
import 'package:e_commerce_app/services/store.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AdminPanalScreen extends StatelessWidget {
  static String routeName = "AdminPanal";
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
                  itemCount: Provider.of<ProductItem>(context).getAllProduct().length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .7),
                  itemBuilder: (context, i) {
                    List<ProductModel>productList=Provider.of<ProductItem>(context).getAllProduct();
                    return ProductCard(product:productList[i]);
                  },
                )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.post_add),
        onPressed: () => Navigator.pushNamed(context, AddNewProductScreen.routeName),
      ),
    );
  }
}

