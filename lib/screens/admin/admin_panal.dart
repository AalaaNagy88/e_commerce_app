import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/helper/screen_helper.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/services/store.dart';
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
              List<QueryDocumentSnapshot> lisData = snapshots.data.docs;
              if (snapshots.hasData) {
                return GridView.builder(
                  itemCount: lisData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .7),
                  itemBuilder: (context, i) {
                    ProductModel product =
                        ProductModel.fromJson(lisData[i].data());
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenHelper.givewidth(context, .02),
                          vertical: 10),
                      child: Column(mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Container(
                          width: ScreenHelper.givewidth(context, .6),
                          height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            child: Image.network(
                              product.imageUrl,
                              fit: BoxFit.fill,
//                              loadingBuilder: (context, child,
//                                      loadingProgress) =>
//                                  Center(child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: Text("\$${product.price}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 2),
                          child: Text("${product.name}"),
                        ),                      ]),
                    );
                  },
                );
              } else
                return Text("test");
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.post_add),
        onPressed: () => Navigator.pushNamed(context, AddNewProduct.routeName),
      ),
    );
  }
}
