import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/store.dart';
import 'package:flutter/material.dart';

import 'edit_product_image_screen.dart';
import 'edit_product_info_screen.dart';

class ProductDetialsScreen extends StatefulWidget {
  final ProductModel product;
  ProductDetialsScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductDetialsScreenState createState() => _ProductDetialsScreenState();
}

class _ProductDetialsScreenState extends State<ProductDetialsScreen> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content:
                      Text("Are you sure to delete ${widget.product.name} ?"),
                  actions: [
                    TextButton(
                      child: Text("Delete"),
                      onPressed: () {
                        try {
                          _store.deleteProduct(widget.product.id);
                          setState(() {
                            Navigator.pop(context);
                          });
                          Navigator.pop(context);
                        } catch (e) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("${e.message}"),
                          ));
                        }
                      },
                    ),
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.givewidth(context, .02)),
        child: ListView(
          children: [
            SizedBox(
              height: ScreenHelper.giveheight(context, .01),
            ),
            Stack(
              children: [
                Center(child: Image.network(widget.product.imageUrl)),
                Positioned(
                    top: 5,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: kMainColor,
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProductImageScreen(
                                    product: widget.product,
                                  )));                        },
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .01),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.black),
                ),
                CircleAvatar(
                  backgroundColor: kMainColor,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProductInfoScreen(
                                    product: widget.product,
                                  )));
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .01),
            ),
            Text(
              widget.product.price + "\$",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: ktextColor),
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            Divider(),
            Text("Description", style: Theme.of(context).textTheme.headline6),
            SizedBox(
              height: ScreenHelper.giveheight(context, .01),
            ),
            Text(
              widget.product.description,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Color(0xFF717BA6)),
            ),
          ],
        ),
      ),
    );
  }
}
