import 'package:e_commerce_app/core/helper/screen_helper.dart';
import 'package:e_commerce_app/core/ui_components/info_widget.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CustomButton({Key key, this.title="Log in", this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenHelper.givewidth(context, .05)),
      child: FlatButton(
          onPressed: onPressed,
          child: InfoWidget(
            builder: (context, deviceInfo) {
              return Container(
                padding: const EdgeInsets.all(10),
                width: deviceInfo.localWidth,
                decoration: BoxDecoration(
                  gradient: kButtonColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: kButtonShadow,
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 0))
                  ],
                ),
                child: Center(
                    child: Text(
                      "$title",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.white),
                    )),
              );
            },
          )),
    );
  }
}
