import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/providers/image_picker_provider.dart';

import 'package:e_commerce_app/widgets/custom_drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'local_function/upload_image.dart';
import 'local_function/upload_product_info.dart';
import 'local_wiget/pick_image_step.dart';
import 'local_wiget/product_detials_step.dart';

class AddNewProductScreen extends StatefulWidget {
  static String routeName = "AddNewProductScreen";

  @override
  _AddNewProductScreenState createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  String _imageUrl, _catogery;
  bool _loading = false;
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Add New Product"),
          ),
          body: Stepper(
              steps: steps(context),
              currentStep: _currentStep,
              controlsBuilder: controlsBuilder)),
    );
  }

  void _isLoading(value) {
    setState(() {
      _loading = value;
    });
  }

  List<Step> steps(context) {
    return [
      Step(
          title: Text("Product image"),
          isActive: _currentStep >= 0,
          state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
          content: PickImageStep()),
      Step(
          title: Text("Product detials"),
          isActive: _currentStep >= 0,
          state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
          content: ProductDetialsStep()),
      Step(
          title: Text("Confirm Adding"),
          isActive: _currentStep >= 0,
          state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
          content: Text(""))
    ];
  }

  Widget controlsBuilder(BuildContext context, {onStepCancel, onStepContinue}) {
    onStepContinue() async {
      if (_currentStep == 0 &&
          Provider.of<ImagePickerProvider>(context, listen: false).image !=
              null) {
        _isLoading(true);
        _imageUrl = await uploadImage(context);
        _isLoading(false);
        setState(() => _currentStep += 1);
      }
      if (Provider.of<ImagePickerProvider>(context, listen: false).image ==
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
      _catogery = CustomDropdownList.category;
      if (_currentStep == 1) {
        if (ProductDetialsStep.globalKey.currentState.validate() &&
            _catogery != null) {
          ProductDetialsStep.globalKey.currentState.save();
          setState(() => _currentStep += 1);
        }
      }
      if (_currentStep == 2) {
        try {
          _isLoading(true);
          uploadProductInfo(ProductDetialsStep.name, ProductDetialsStep.price,
              ProductDetialsStep.description, _catogery, _imageUrl);
          _isLoading(false);
          Provider.of<ImagePickerProvider>(context, listen: false)
              .pickImage(null);
          Navigator.pop(context);
        } catch (e) {
          _isLoading(false);
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("${e.message}"),
          ));
        }
      }
    }

    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: ScreenHelper.givewidth(context, .3),
        child: RaisedButton(
            onPressed: onStepContinue,
            textColor: Colors.white,
            color: Colors.indigoAccent,
            textTheme: ButtonTextTheme.normal,
            child: Row(children: <Widget>[
              _currentStep >= 2 ? Icon(Icons.done) : Icon(Icons.chevron_right),
              _currentStep >= 2 ? Text("DONE") : Text("NEXT")
            ])),
      ),
    );
  }
}
