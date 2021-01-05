import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'local_widget/card_size.dart';
import 'local_widget/custom_flat_button.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProductDetialsForUser extends StatefulWidget {
  final ProductModel product;

  ProductDetialsForUser({Key key, this.product}) : super(key: key);

  @override
  _ProductDetialsForUserState createState() => _ProductDetialsForUserState();
}

class _ProductDetialsForUserState extends State<ProductDetialsForUser> {
  List<String> sizes = ["S", "M", "L", "XL", "XXL"];

  int selectedIndex = -1;

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
            Center(child: Image.network(widget.product.imageUrl)),
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
                    widget.product.name,
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
                    widget.product.price + "\$",
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
              padding: EdgeInsets.symmetric(
                  vertical: ScreenHelper.giveheight(context, .01)),
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
                    "veryGood".tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.black),
                  ),
                  Text(
                    "49" + "reviews".tr,
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
              padding: EdgeInsets.symmetric(
                  vertical: ScreenHelper.giveheight(context, .01)),
              child: Text("description".tr,
                  style: Theme.of(context).textTheme.headline6),
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .01),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenHelper.giveheight(context, .01)),
              child: Text(
                widget.product.description,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Color(0xFF717BA6)),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenHelper.giveheight(context, .01)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "selectSize".tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenHelper.giveheight(context, .01)),
              child: Center(
                child: Container(
                    height: 80,
                    child: ListView.builder(
                      itemCount: sizes.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return InkWell(
                            onTap: () => setState(() {
                                  selectedIndex = i;
                                }),
                            child: SizeCard(
                              size: sizes[i],
                              color: selectedIndex == i
                                  ? kMainColor
                                  : Color(0xFFF3F3F3),
                            ));
                      },
                    )),
              ),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     SizeCard(
              //       size: "S",
              //     ),
              //     SizeCard(
              //       size: "M",
              //       color: kMainColor,
              //     ),
              //     SizeCard(
              //       size: "L",
              //     ),
              //   ],
              // ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomFlatButton(
        product: widget.product,
      ),
    );
  }
}
