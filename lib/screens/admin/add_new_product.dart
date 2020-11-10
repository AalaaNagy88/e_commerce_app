import 'package:e_commerce_app/core/helper/screen_helper.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddNewProduct extends StatefulWidget {
  static String routeName = "AddNewProduct";

  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Colors.grey[700],
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenHelper.givewidth(context, .05)),
                  child: Text(
                    "Add New Product",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .1),
            ),
            CustomTextFormField(label: "Product name"),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            CustomTextFormField(
              label: "Product price",
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            CustomTextFormField(
              label: "Product Description",
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .03),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.givewidth(context, .05)),
              child: new DropdownButton<String>(
                value: category,
                isExpanded: true,
                hint:Text("Product category"),
                items: <String>['Women', 'Men', 'Kids'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState((){
                    category =value;
                  });
                },
              )
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .03),
            ),

          ],
        ),
      ),
    );
  }
}
