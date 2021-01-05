import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/models/order_model.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/user_info_provider.dart';
import 'package:e_commerce_app/services/user_operations.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'confirm_screen.dart';
import 'local_widget/cart_item.dart';
import 'local_widget/row_widget_of_checkout.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

// ignore: must_be_immutable
class CheckOutScreen extends StatelessWidget {
  static String routeName = "CheckOutScreen";
  final String selectedAddress;

  CheckOutScreen({Key key, this.selectedAddress}) : super(key: key);
  UserOperations _userOperations = UserOperations();

  List<CartItemModel> cart;
  @override
  Widget build(BuildContext context) {
    cart = Provider.of<CartProvider>(context).cart;
    return DefaultScreen(
      title: "Checkout".tr,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenHelper.giveheight(context, .01)),
                child: CartItem(
                  item: cart[i],
                  canBeCanceled: false,
                  orderded: true,
                ),
              );
            },
          ),
        ),
        ListTile(
          title: Text(selectedAddress),
          trailing: Radio(
            value: selectedAddress,
            groupValue: selectedAddress,
            onChanged: (value) {},
          ),
        ),
        Divider(),
        RowWidgetOfCheckout(
          title: "Subtotal".tr,
          value: "\$ ${_subTotalPrices()}",
        ),
        RowWidgetOfCheckout(
          title: "Discount".tr,
          value: "5%",
        ),
        RowWidgetOfCheckout(
          title: "Shipping".tr,
          value: "\$10",
        ),
        Divider(),
        ListTile(
          title: Text("total".tr),
          trailing: Text("\$ ${_totalPrices()}"),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CustomButton(
            onPressed: () {
              OrderModel order = OrderModel(
                  address: selectedAddress,
                  phone: Provider.of<UserInfoProvider>(context, listen: false)
                      .user
                      .phone,
                  items: cartItemModelToJson(cart),
                  total: _totalPrices());
              try {
                _userOperations.addNewOrder(context, order);
                _userOperations.truncateCartAfterOrder(context);
                Provider.of<CartProvider>(context, listen: false).cart = [];
                Navigator.pushReplacementNamed(
                    context, ConfirmScreen.routeName);
              } catch (e) {
                // print(e);
              }
            },
            title: "ordernow".tr,
          ),
        )
      ],
    );
  }

  double _subTotalPrices() {
    double _sum = 0;
    for (CartItemModel item in cart) {
      _sum += double.parse(item.price) * item.quantity;
    }
    return _sum;
  }

  double _totalPrices() {
    double _sum = _subTotalPrices();
    double discount = _sum * .5;
    _sum -= discount;
    _sum += 10;
    return _sum;
  }
}
