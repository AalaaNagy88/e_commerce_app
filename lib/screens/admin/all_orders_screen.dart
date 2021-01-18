import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/models/order_model.dart';
import 'package:e_commerce_app/services/store.dart';
import 'package:e_commerce_app/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import 'order_detials.dart';

class AllOrdersScreen extends StatelessWidget {
  static String routeName = "AllOrdersScreen";
  AllOrdersScreen({Key key}) : super(key: key);
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(title: "All Orders", children: [
      StreamBuilder<List<OrderModel>>(
          stream: _store.loadAllorders(),
          builder: (context, list) {
            if (list.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );
            else {
              return Expanded(
                child: ListView.builder(
                  itemCount: list.data.length,
                  itemBuilder: (context, i) => InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderDetials(
                                  items:
                                      cartItemModelFromJson(list.data[i].items),
                                ))),
                    child: Card(
                      color: kButtonShadow,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenHelper.givewidth(context, .05)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address".tr +
                                " : " +
                                "${list.data[i].address}"),
                            Text("Subtotal".tr +
                                " : " +
                                "${list.data[i].total}"),
                            Text("phoneNumber".tr +
                                " : " +
                                "${list.data[i].phone}"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
    ]);
  }
}
