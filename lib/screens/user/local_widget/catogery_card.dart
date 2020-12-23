import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:flutter/material.dart';

class CatogeryCard extends StatelessWidget {
  final String name;
  final LinearGradient color;
  CatogeryCard({
    @required this.name, @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal:ScreenHelper.givewidth(context, .03)),
        child:
        Stack(
          children: [
            Container(
                width: ScreenHelper.givewidth(context, .5),
                height: ScreenHelper.giveheight(context, .15),
                child: Image.asset(
                  "assets/images/$name.jpg",
                  fit: BoxFit.fill,
                )),
            Opacity(
              opacity: .8,
              child: Container(
                child: Center(
                  child: Text(
                    name[0].toUpperCase()+name.substring(1),
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white),
                  ),
                ),
                width: ScreenHelper.givewidth(context, .5),
                height: ScreenHelper.giveheight(context, .15),
                decoration: BoxDecoration(
                  gradient: color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ));
  }
}
