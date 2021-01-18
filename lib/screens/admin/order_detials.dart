import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/screens/user/local_widget/cart_item.dart';
import 'package:e_commerce_app/widgets/default_screen.dart';
import 'package:flutter/material.dart';

class OrderDetials extends StatelessWidget {
  static String routeName = "OrderDetials";
  final List<CartItemModel> items;

  const OrderDetials({Key key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(title: "Order Detials", children: [
      Expanded(
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, i) => CartItem(
                    item: items[i],
                    canBeCanceled: false,
                    orderded: true,
                  )))
    ]);
  }
}
