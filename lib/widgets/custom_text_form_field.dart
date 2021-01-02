import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String label;
  final Function onSaved;
  bool isPassword;
  bool isNumbersOnly;
  final String initialValue;

  CustomTextFormField(
      {Key key,
      this.label,
      this.isPassword = false,
      this.onSaved,
      this.initialValue,
      this.isNumbersOnly = false})
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
        validator: (value) => value.isEmpty
            ? "Please, Enter vaild ${widget.label.toLowerCase()}"
            : null,
        initialValue: widget.initialValue,
        keyboardType:
            widget.isNumbersOnly ? TextInputType.number : TextInputType.text,
        onSaved: widget.onSaved,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
            labelText: "${widget.label}",
            suffixIcon: widget.label == "Password"
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
