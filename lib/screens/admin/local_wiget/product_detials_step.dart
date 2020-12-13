import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/widgets/custom_drop_down_list.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ProductDetialsStep extends StatelessWidget {
  final ProductModel product;

  const ProductDetialsStep({Key key, this.product}) : super(key: key);
  static GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  static String name, price, description;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          SizedBox(
            height: ScreenHelper.giveheight(context, .01),
          ),
          CustomTextFormField(
            initialValue: product==null?"":product.name,
              label: "Product name", onSaved: (value) => name = value),
          SizedBox(
            height: ScreenHelper.giveheight(context, .02),
          ),
          CustomTextFormField(
            initialValue: product==null?"":product.price,
            label: "Product price",
            onSaved: (value) => price = value,
          ),
          SizedBox(
            height: ScreenHelper.giveheight(context, .02),
          ),
          CustomTextFormField(
            initialValue: product==null?"":product.description,
            label: "Product description",
            onSaved: (value) => description = value,
          ),
          SizedBox(
            height: ScreenHelper.giveheight(context, .03),
          ),
          CustomDropdownList(),
          SizedBox(
            height: ScreenHelper.giveheight(context, .03),
          ),
        ],
      ),
    );
  }
}
