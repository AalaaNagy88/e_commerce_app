import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/store.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class GetAllProducts extends StatelessWidget {
  final _store = Store();
  final bool isAdmin;

  GetAllProducts({Key key, this.isAdmin=true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Center(
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
                    ProductModel.fromJson(lisData[i].data(), lisData[i].id);
                    print(product.name);
                    return ProductCard(product: product,isAdmin: isAdmin,);
                  },
                );
              } else
                return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
