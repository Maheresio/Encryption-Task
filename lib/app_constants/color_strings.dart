import 'package:flutter/material.dart';

class ColorConstants{
  static const String primaryHexColor = '2EA7A2';
  static const int primaryColor = 0xFF2EA7A2;
  static const String scaffoldColor = 'F9F9F9';

  static const Map<int, Color> color = {
    50: Color.fromRGBO(46, 167, 162, .1),
    100: Color.fromRGBO(46, 167, 162, .2),
    200: Color.fromRGBO(46, 167, 162, .3),
    300: Color.fromRGBO(46, 167, 162, .4),
    400: Color.fromRGBO(46, 167, 162, .5),
    500: Color.fromRGBO(46, 167, 162, .6),
    600: Color.fromRGBO(46, 167, 162, .7),
    700: Color.fromRGBO(46, 167, 162, .8),
    800: Color.fromRGBO(46, 167, 162, .9),
    900: Color.fromRGBO(46, 167, 162, 1),
  };
  static MaterialColor primarySwatch = const MaterialColor(primaryColor, color);
}