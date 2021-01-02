import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultScreen extends StatelessWidget {
  static String routeName = "AllAdressesScreen";
  final String title;
  final List<Widget> children;

  const DefaultScreen({Key key, @required this.title, @required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenHelper.giveheight(context, .05),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.givewidth(context, .05)),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.black),
              ),
            ),
            SizedBox(
              height: ScreenHelper.giveheight(context, .02),
            ),
            ...children
          ],
        ));
  }
}
