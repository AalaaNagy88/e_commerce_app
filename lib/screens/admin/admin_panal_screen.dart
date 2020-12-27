import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/providers/product_item_provider.dart';
import 'package:e_commerce_app/screens/admin/add_new_product_screen.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AdminPanalScreen extends StatelessWidget {
  static String routeName = "AdminPanal";
  List<ProductModel> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:GridView.builder(
                  itemCount: Provider.of<ProductItem>(context).productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .7),
                  itemBuilder: (context, i) {
                    ProductModel product =Provider.of<ProductItem>(context).productList[i];
                    return ProductCard(product: product);
                  },
                )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.post_add),
        onPressed: () {
          print(Provider.of<ProductItem>(context, listen: false)
              .productList
              .length);
          Navigator.pushNamed(context, AddNewProductScreen.routeName);
        },
      ),
    );
  }
}
