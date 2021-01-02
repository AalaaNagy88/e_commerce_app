import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/product_item_provider.dart';
import 'package:e_commerce_app/services/user_operations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final CartItemModel item;

  const CartItem({Key key, this.item}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  UserOperations _userOperations = UserOperations();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
                width: ScreenHelper.givewidth(context, .3),
                height: ScreenHelper.giveheight(context, .2),
                child: Image.network(
                  widget.item.imageUrl,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: ScreenHelper.givewidth(context, .02),
            ),
            Container(
              width: ScreenHelper.givewidth(context, .6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.item.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      IconButton(
                        onPressed: () {
                          ProductModel currentproduct = ProductModel();
                          for (ProductModel product in Provider.of<ProductItem>(
                                  context,
                                  listen: false)
                              .productList) {
                            if (product.name == widget.item.name) {
                              currentproduct.name = product.name;
                              product.addedTocart = true;
                            }
                          }
                          setState(() {
                            currentproduct.addedTocart = false;
                          });
                          Provider.of<ProductItem>(context, listen: false)
                              .isInCart(currentproduct, false);
                          _userOperations.removeCartItem(
                              context, widget.item.id);
                          Provider.of<CartProvider>(context, listen: false)
                              .removeFromCart(widget.item);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey[700],
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.item.price + "\$",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: ktextColor),
                  ),
                  SizedBox(
                    height: ScreenHelper.giveheight(context, .02),
                  ),
                  Container(
                    width: ScreenHelper.givewidth(context, .35),
                    height: ScreenHelper.giveheight(context, .05),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (widget.item.quantity > 1) {
                              setState(() {
                                widget.item.quantity--;
                              });
                              _userOperations.updateItemCartQuantity(context,
                                  widget.item.id, widget.item.quantity);
                            }
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text("${widget.item.quantity}"),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.item.quantity++;
                            });
                            _userOperations.updateItemCartQuantity(
                                context, widget.item.id, widget.item.quantity);
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
