import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:flutter/material.dart';

class SizeCard extends StatelessWidget {
  const SizeCard({
    this.color = const Color(0xFFF3F3F3),
    @required this.size,
    Key key,
  }) : super(key: key);
  final String size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper.givewidth(context, .2),
      height: ScreenHelper.giveheight(context, .11),
      child: Card(
        color: color,
        child: Center(
            child: Text(
          size,
          style: Theme.of(context).textTheme.headline4.copyWith(
              color: color != Color(0xFFF3F3F3) ? Colors.white : Colors.grey),
        )),
      ),
    );
  }
}
