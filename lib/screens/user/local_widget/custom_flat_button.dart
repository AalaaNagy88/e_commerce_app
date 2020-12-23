import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';


class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper.givewidth(context, 1),
      height: ScreenHelper.giveheight(context, .08),
      decoration: BoxDecoration(gradient: kButtonColor),
      child: FlatButton(
        onPressed: () {},
        child: Center(
          child: Text(
            "Add To Cart".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
