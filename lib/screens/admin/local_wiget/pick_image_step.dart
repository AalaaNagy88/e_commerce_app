import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/providers/image_picker_provider.dart';
import 'package:e_commerce_app/widgets/image_with_broder.dart';
import 'package:e_commerce_app/widgets/pick_image_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PickImageStep extends StatelessWidget {
  const PickImageStep({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PickImageMethods(),
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
      ],
    );
  }
}
