import 'package:e_commerce_app/screens/admin/product_detials_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    Key key,
    @required this.widget,
    @required this.onPressed,
  }) : super(key: key);

  final ProductDetialsScreen widget;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kMainColor,
      child: IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
