import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/services/store.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'add_new_product.dart';

class AdminPanal extends StatelessWidget {
  static String routeName = "AdminPanal";
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
            stream: _store.loadAllProducts(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                List<QueryDocumentSnapshot> lisData = snapshots.data.docs;
                return GridView.builder(
                  itemCount: lisData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .7),
                  itemBuilder: (context, i) {
                    ProductModel product =
                        ProductModel.fromJson(lisData[i].data(),lisData[i].id);
                    return ProductCard(product: product);
                  },
                );
              } else
                return Center(child: CircularProgressIndicator());
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.post_add),
        onPressed: () => Navigator.pushNamed(context, AddNewProduct.routeName),
      ),
    );
  }
}

