import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:flutter/material.dart';

import 'custom_pick_image.dart';

class PickImageMethods extends StatelessWidget {
  const PickImageMethods({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
