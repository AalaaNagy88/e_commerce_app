import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/helper/screen_helper.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/screens/admin/edit_product.dart';
import 'package:e_commerce_app/services/store.dart';
import 'package:flutter/material.dart';

class ProductDetials extends StatefulWidget {
  final ProductModel product;
  ProductDetials({Key key, this.product}) : super(key: key);

  @override
  _ProductDetialsState createState() => _ProductDetialsState();
}

class _ProductDetialsState extends State<ProductDetials> {
  final _store = Store();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProduct(
                            product: widget.product,
                          )));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () {
              showDialog(context: context,builder: (_)=>AlertDialog(
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
                      }catch(e){
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text("${e.message}"),));
                      }
                    },
                  ),
                  TextButton(
                    child: Text("Cancel"),
                    onPressed: ()=>Navigator.pop(context),
                  )
                ],
              ),);
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
            Image.network(widget.product.imageUrl),
            SizedBox(
              height: ScreenHelper.giveheight(context, .01),
            ),
            Text(
              widget.product.name,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.black),
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
