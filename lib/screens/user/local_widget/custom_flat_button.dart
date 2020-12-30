import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/product_item_provider.dart';
import 'package:e_commerce_app/services/user_operations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class CustomFlatButton extends StatefulWidget {
  final ProductModel product;
  const CustomFlatButton({
    this.product,
    Key key,
  }) : super(key: key);

  @override
  _CustomFlatButtonState createState() => _CustomFlatButtonState();
}

class _CustomFlatButtonState extends State<CustomFlatButton> {
  UserOperations _userOperations=UserOperations();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      int i=Provider.of<CartProvider>(context,listen: false).cart.indexWhere((element) => element.name==widget.product.name);
      print(i.toString());
      if(i>=0) {
        Provider.of<ProductItem>(context, listen: false).isInCart(
            widget.product, true);
        setState(() {
          widget.product.addedTocart = true;
        });
      }    });
  }

  @override
  Widget build(BuildContext context) {
    _pressed(context) {
      CartItemModel item = CartItemModel(
          price: widget.product.price,
          name: widget.product.name,
          imageUrl: widget.product.imageUrl,
          size: "");
      Provider.of<CartProvider>(context, listen: false)
          .addToCart(item);
      _userOperations.addItemToCart(item,context);
      setState(() {
        widget.product.addedTocart = true;
      });
      Provider.of<ProductItem>(context,listen: false).isInCart(widget.product, true);
    }

    return Container(
      width: ScreenHelper.givewidth(context, 1),
      height: ScreenHelper.giveheight(context, .08),
      decoration: BoxDecoration(
          gradient: widget.product.addedTocart
              ? kDissabledButtonColor
              : kButtonColor),
      child: FlatButton(
        disabledColor: Colors.grey,
        onPressed: () => widget.product.addedTocart ? null : _pressed(context),
        child: Center(
          child: Text(
            widget.product.addedTocart
                ? "Added To Cart".toUpperCase()
                : "Add To Cart".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
