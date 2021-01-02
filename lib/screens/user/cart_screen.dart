import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'all_addresses_screen.dart';
import 'local_widget/cart_item.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "CartScreen";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List<CartItemModel> cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenHelper.givewidth(context, .05)),
            child: Text(
              "Cart",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.black),
            ),
          ),
//          StreamBuilder<QuerySnapshot>(
//            stream: _userOperations.loadAllCartItems(context),
//            builder: (context, s) {
//              if (s.hasData) {
//                List<QueryDocumentSnapshot> lisData = s.data.docs;
//                return Flexible(
//                  flex: 1,
//                  child: ListView.builder(
//                    itemCount: lisData.length,
//                    itemBuilder: (context, i) {
//                      CartItemModel item =
//                          CartItemModel.fromJson(lisData[i].data());
//                      return Padding(
//                          padding: EdgeInsets.symmetric(
//                              vertical: ScreenHelper.giveheight(context, .01)),
//                          child: CartItem(item: item));
//                    },
//                  ),
//                );
//              } else
//                return Text("Null");
//            },
//          ),
          cart.length == 0
              ? Center(
                  child: Text("Cart is empty"),
                )
              : Flexible(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, i) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenHelper.giveheight(context, .01)),
                          child: CartItem(item: cart[i]));
                    },
                  ),
                ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          height: ScreenHelper.giveheight(context, .07),
          color: Colors.transparent,
          child: CustomButton(
            onPressed: () => cart.length != 0
                ? Navigator.pushNamed(context, AllAdressesScreen.routeName)
                : showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                            content:
                                Text("Please, Add items to cart to continue"),
                            actions: [
                              TextButton(
                                  child: Text("Okay"),
                                  onPressed: () => Navigator.pop(context)),
                            ])),
            title: "Countinue",
          ),
        ),
      ),
    );
  }
}
