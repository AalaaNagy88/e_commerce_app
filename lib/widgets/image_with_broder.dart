import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:flutter/material.dart';
class ImageWithBroder extends StatelessWidget {
  final Widget imageSource;
  const ImageWithBroder({Key key, this.imageSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenHelper.givewidth(context, .05)),
      child: Container(
        padding: EdgeInsets.all(ScreenHelper.givewidth(context, .03)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kMainColor, width: 1)),
        child: Center(child: imageSource),
      ),
    );
  }}