import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/providers/image_picker_provider.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';


import 'admin_panal_screen.dart';
import 'local_function/update_product_details.dart';
import 'local_function/upload_image.dart';
import 'local_wiget/pick_image_step.dart';

class EditProductImageScreen extends StatefulWidget {
  static String routeName="EditProductImageScreen";
  final ProductModel product;

  const EditProductImageScreen({Key key, this.product}) : super(key: key);

  @override
  _EditProductImageScreenState createState() => _EditProductImageScreenState();
}

class _EditProductImageScreenState extends State<EditProductImageScreen> {
  String _imageUrl;
  bool _loading = false;


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        body: ListView(
          children: [
            PickImageStep(),
            Builder(
              builder: (context) => CustomButton(
                onPressed: () async {
                  if (Provider.of<ImagePickerProvider>(context, listen: false)
                          .image !=
                      null) {
                    _isLoading(true);
                    _imageUrl = await uploadImage(context);
                    widget.product.imageUrl = _imageUrl;
                    updateProductDetials(widget.product);
                    Navigator.popAndPushNamed(
                        context, AdminPanalScreen.routeName);
                    _isLoading(false);
                  }
                  if (Provider.of<ImagePickerProvider>(context, listen: false)
                          .image ==
                      null) {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              content: Text("Please, pick product image"),
                              actions: [
                                TextButton(
                                    child: Text("Okay"),
                                    onPressed: () => Navigator.pop(context)),
                              ],
                            ));
                  }
                },
                title: "Save edits",
              ),
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
