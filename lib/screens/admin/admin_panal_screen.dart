import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/admin/add_new_product_screen.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AdminPanalScreen extends StatelessWidget {
  static String routeName = "AdminPanal";

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = Provider.of<List<ProductModel>>(context);
    return Scaffold(
      body: Center(
          child: products != null
              ? GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .7),
                  itemBuilder: (context, i) {
                    ProductModel product = products[i];
                    return ProductCard(product: product);
                  },
                )
              : CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.post_add),
        onPressed: () {
          Navigator.pushNamed(context, AddNewProductScreen.routeName);
        },
      ),
    );
  }
}
