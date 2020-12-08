import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/services/store.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatelessWidget {
  static String routeName = "EditProduct";
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
            stream: _store.loadAllProducts(),
            builder: (context, snapshots) {
              List<QueryDocumentSnapshot> lisData = snapshots.data.docs;
              if (snapshots.hasData) {
                return ListView.builder(
//                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                      crossAxisCount: 2),
                  itemCount: lisData.length,
                  itemBuilder: (context, i) {
                    ProductModel product =
                        ProductModel.fromJson(lisData[i].data());
                    return Stack(
                      children: [
                        Positioned.fill(
                           child: Image.network(product.imageUrl,)
                        )
                      ],
                    );
                  },
                );
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            }),
      ),
    );
  }
}
