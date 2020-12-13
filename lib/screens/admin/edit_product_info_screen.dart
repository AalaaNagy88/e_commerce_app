import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/admin/local_wiget/product_detials_step.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'admin_panal_screen.dart';
import 'local_function/update_product_details.dart';

// ignore: must_be_immutable
class EditProductInfoScreen extends StatefulWidget {
  static String routeName = "EditProductInfoScreen";
  ProductModel product;
  EditProductInfoScreen({Key key, this.product}) : super(key: key);

  @override
  _EditProductInfoScreenState createState() => _EditProductInfoScreenState();
}

class _EditProductInfoScreenState extends State<EditProductInfoScreen> {
  String _catogery;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Product"),
        ),
        body: ListView(
          children: [
            ProductDetialsStep(product: widget.product,),
                  SizedBox(
                    height: ScreenHelper.giveheight(context, .05),
                  ),
                  Builder(
                    builder: (context) => CustomButton(
                      onPressed: () async {
                        _catogery = CustomDropdownList.category;
                        if (ProductDetialsStep.globalKey.currentState.validate() &&
                            _catogery != null ) {
                          ProductDetialsStep.globalKey.currentState.save();
                          try {
                            widget.product.name = ProductDetialsStep.name;
                            widget.product.price = ProductDetialsStep.price;
                            widget.product.description = ProductDetialsStep.description;
                            widget.product.category = _catogery;
                            _isLoading(true);
                            updateProductDetials(widget.product);
                            Navigator.popAndPushNamed(
                                context, AdminPanalScreen.routeName);
                            _isLoading(false);
                          } catch (e) {
                            _isLoading(false);
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("${e.message}"),
                            ));
                          }
                        }
                        _isLoading(false);
                      },
                      title: "Save edits",
                    ),
                  ),
                  SizedBox(
                    height: ScreenHelper.giveheight(context, .05),
                  ),
                ],
              ),
            ),
    );
  }

  void _isLoading(value) {
    setState(() {
      _loading = value;
    });
  }
}
