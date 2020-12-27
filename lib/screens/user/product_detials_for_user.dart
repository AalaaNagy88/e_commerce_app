import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'local_widget/card_size.dart';
import 'local_widget/custom_flat_button.dart';

class ProductDetialsForUser extends StatelessWidget {
  final ProductModel product;

  const ProductDetialsForUser({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.givewidth(context, .02)),
        child: ListView(
          children: [
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            Center(child: Image.network(product.imageUrl)),
            SizedBox(
              height: ScreenHelper.giveheight(context, .01),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.givewidth(context, .01),
                  vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.black, fontSize: 35),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .01),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.givewidth(context, .01)),
              child: Row(
                children: [
                  Text(
                    product.price + "\$",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: ktextColor, fontSize: 30),
                  ),
                  SizedBox(
                    width: ScreenHelper.givewidth(context, .04),
                  ),
                  Text(
                    "1000\$",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey[700],
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            Divider(),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: ScreenHelper.giveheight(context, .01)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: ScreenHelper.givewidth(context, .2),
                    height: ScreenHelper.giveheight(context, .05),
                    child: Center(
                        child: Text(
                      "4.5",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  Text(
                    "Very Good",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.black),
                  ),
                  Text(
                    "49 Reviews",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: kMainColor),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: ScreenHelper.giveheight(context, .01)),
              child: Text("Description", style: Theme.of(context).textTheme.headline6),
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .01),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: ScreenHelper.giveheight(context, .01)),
              child: Text(
                product.description,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Color(0xFF717BA6)),
              ),
            ),
            Divider(),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: ScreenHelper.giveheight(context, .01)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center
              ,children: [
                Text(
                  "Select Size",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.black),
                ),
              ],),
            ),
            Divider(),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: ScreenHelper.giveheight(context, .01)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                SizeCard(size: "S",),
                SizeCard(size: "M",color: kMainColor,),
                SizeCard(size: "L",),
              ],),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomFlatButton(
        product: product,
      ),
    );
  }
}
