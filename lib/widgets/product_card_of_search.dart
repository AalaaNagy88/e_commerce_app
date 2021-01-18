import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/user/product_detials_for_user.dart';
import 'package:flutter/material.dart';

class ProducutCardOfSearch extends StatelessWidget {
  final ProductModel product;

  const ProducutCardOfSearch({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetialsForUser(
                    product: product,
                  ))),
      child: Container(
        height: ScreenHelper.giveheight(context, .2),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                    width: ScreenHelper.givewidth(context, .3),
                    height: ScreenHelper.giveheight(context, .2),
                    child: Image.network(
                      product.imageUrl,
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
                            product.name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      Text(
                        product.price + "\$",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: ktextColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
