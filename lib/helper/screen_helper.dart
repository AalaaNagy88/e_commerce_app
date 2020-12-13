import 'package:flutter/material.dart';

class ScreenHelper {
  static double _width = 0;
  static double _height = 0;
  static var _mediaQueryData;

  static double giveheight(BuildContext context,double factor) {
    _getOrientation(context);
    return _height * factor;
  }
  static double givewidth(BuildContext context,double factor) {
    _getOrientation(context);
    return _width * factor;
  }

  static _getOrientation(context) {
    _mediaQueryData = MediaQuery.of(context);
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      _width = _mediaQueryData.size.height;
      _height = _mediaQueryData.size.width;
    } else
      _width = _mediaQueryData.size.width;
    _height = _mediaQueryData.size.height;
  }
}
