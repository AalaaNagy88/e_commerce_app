import 'package:e_commerce_app/core/helper/screen_helper.dart';
import 'package:flutter/material.dart';

class CustomDropdownList extends StatefulWidget {
  static String category;
  @override
  _CustomDropdownListState createState() => _CustomDropdownListState();
}

class _CustomDropdownListState extends State<CustomDropdownList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.givewidth(context, .05)),
        child: new DropdownButton<String>(
          value: CustomDropdownList.category,
          isExpanded: true,
          hint:Text("Product category"),
          items: <String>['Women', 'Men', 'Kids'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState((){
              CustomDropdownList.category =value;
            });
          },
        )
    );
  }
}
