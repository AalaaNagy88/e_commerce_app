import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/models/order_model.dart';
import 'package:e_commerce_app/providers/user_info_provider.dart';
import 'package:e_commerce_app/services/user_operations.dart';
import 'package:e_commerce_app/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'local_widget/cart_item.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

// ignore: must_be_immutable
class OrderScreen extends StatelessWidget {
  static String routeName = "OrderScreen";
  UserOperations _userOperations = UserOperations();
  @override
  Widget build(BuildContext context) {
    try {
      _userOperations.getCurrentUserInfo(
          Provider.of<UserInfoProvider>(context).user.email, context);
    } catch (e) {
      print(e.message);
    }
    return DefaultScreen(
      title: "orders".tr,
      children: [
        Provider.of<UserInfoProvider>(context).user.orderId != ""
            ? StreamBuilder<DocumentSnapshot>(
                stream: _userOperations.laodCurrentUserOrder(context),
                builder: (context, s) {
                  if (s.hasData) {
                    OrderModel order = OrderModel.fromJson(s.data.data());
                    List<CartItemModel> items =
                        cartItemModelFromJson(order.items);
                    return Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, i) {
                                CartItemModel item = items[i];
                                return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: ScreenHelper.giveheight(
                                            context, .01)),
                                    child: CartItem(
                                      item: item,
                                      canBeCanceled: false,
                                      orderded: true,
                                    ));
                              },
                            ),
                          ),
                          ListTile(
                            title: Text("total".tr),
                            trailing: Text("\$ ${order.total}"),
                          ),
                        ],
                      ),
                    );
                  } else if (s.data.data().length == 0) {
                    return Center(child: Text("noOrder".tr));
                  } else
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                },
              )
            : Center(child: Text("noOrder".tr))
      ],
    );
  }
}
