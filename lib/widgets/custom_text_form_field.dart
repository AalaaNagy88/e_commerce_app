import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String label;
  final Function onSaved;
  bool isPassword;
  bool isNumbersOnly;
  final String initialValue;
  final TextEditingController controller;

  CustomTextFormField(
      {Key key,
      this.label,
      this.isPassword = false,
      this.onSaved,
      this.initialValue,
      this.isNumbersOnly = false,
      this.controller})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenHelper.givewidth(context, .05)),
      child: TextFormField(
        controller: widget.controller,
        validator: (value) => value.isEmpty
            ? "ensureVaild".tr + " ${widget.label.toLowerCase()}"
            : null,
        initialValue: widget.initialValue,
        keyboardType:
            widget.isNumbersOnly ? TextInputType.number : TextInputType.text,
        onSaved: widget.onSaved,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
            labelText: "${widget.label}",
            suffixIcon: widget.label == "password".tr
                ? IconButton(
                    icon: Icon(widget.isPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        widget.isPassword = !widget.isPassword;
                      });
                    },
                  )
                : null),
      ),
    );
  }
}
