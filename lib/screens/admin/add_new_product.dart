import 'package:e_commerce_app/core/helper/screen_helper.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/providers/image_picker_provider.dart';
import 'package:e_commerce_app/services/store.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_drop_down_list.dart';
import 'package:e_commerce_app/widgets/custom_pick_image.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/widgets/image_with_broder.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class AddNewProduct extends StatefulWidget {
  static String routeName = "AddNewProduct";

  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _name, _price, _description, _imageUrl, _catogery;
  final _store = Store();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add New Product"),
        ),
        body: Form(
          key: _globalKey,
          child: ListView(
            children: [
              SizedBox(
                height: ScreenHelper.giveheight(context, .01),
              ),
              CustomTextFormField(
                label: "Product name",
                onSaved: (value) {
                  _name = value;
                },
              ),
              SizedBox(
                height: ScreenHelper.giveheight(context, .02),
              ),
              CustomTextFormField(
                label: "Product price",
                onSaved: (value) {
                  _price = value;
                },
              ),
              SizedBox(
                height: ScreenHelper.giveheight(context, .02),
              ),
              CustomTextFormField(
                label: "Product description",
                onSaved: (value) {
                  _description = value;
                },
              ),
              SizedBox(
                height: ScreenHelper.giveheight(context, .03),
              ),
              CustomDropdownList(),
              SizedBox(
                height: ScreenHelper.giveheight(context, .03),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.givewidth(context, .05)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomPickImage(
                      icon: Icons.camera_alt,
                      fromCamera: true,
                    ),
                    CustomPickImage(
                      icon: Icons.photo,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenHelper.giveheight(context, .03),
              ),
              if (Provider.of<ImagePickerProvider>(context).image != null) ...[
                ImageWithBroder(
                  imageSource: Image.file(
                      Provider.of<ImagePickerProvider>(context).image,
                      fit: BoxFit.cover),
                ),
              ],
              SizedBox(
                height: ScreenHelper.giveheight(context, .05),
              ),
              Builder(
                builder: (context) => CustomButton(
                  onPressed: () async {
                    _catogery = CustomDropdownList.category;
                    if (_globalKey.currentState.validate() &&
                        _catogery != null) {
                      _globalKey.currentState.save();
                      try {
                        _isLoading(true);
                        _imageUrl = await _store.uploadImage(context);
                        _store.addNewProduct(ProductModel(
                            name: _name,
                            price: _price,
                            description: _description,
                            category: _catogery,
                            imageUrl: _imageUrl));
                        _isLoading(false);
                        Navigator.pop(context);
                      } catch (e) {
                        _isLoading(false);
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("${e.message}"),
                        ));
                      }
                    }
                    _isLoading(false);
                  },
                  title: "Add",
                ),
              ),
              SizedBox(
                height: ScreenHelper.giveheight(context, .05),
              ),
            ],
          ),
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
