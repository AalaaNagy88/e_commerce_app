import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/admin/product_detials_screen.dart';
import 'package:e_commerce_app/screens/user/product_detials_for_user.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key key, @required this.product, this.isAdmin = true})
      : super(key: key);

  final ProductModel product;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isAdmin
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetialsScreen(
                        product: product,
                      )))
          : Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetialsForUser(
                        product: product,
                      ))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.givewidth(context, .02), vertical: 10),
        child: Stack(children: [
          Container(
            width: ScreenHelper.givewidth(context, .6),
            height: 180,
            decoration: BoxDecoration(
              gradient: kButtonColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: kButtonShadow,
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 0))
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 55,
              width: ScreenHelper.givewidth(context, .46),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "\$${product.price}",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 2),
                    child: Text("${product.name}",
                        style: Theme.of(context).textTheme.subtitle2),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
