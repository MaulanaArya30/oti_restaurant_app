import 'package:flutter/material.dart';

double kMenuScreenHeight = 0.9;

double kDefaultPadding = 60;

double kMenuPagePadding = kDefaultPadding - 15;

//double kMenuAspectRatio = 0.75;
double kMenuAspectRatio = 600 / 80;

//Color kBackgroundColor = const Color(0xFF1C1D1F);

//Color kWidgetColor = const Color(0xFF27282A);

class appColors {
  static const backgroundColor = const Color(0xFF1C1D1F);
  static const widgetColor = const Color(0xFF27282A);
  static const buttonColor = const Color(0xFFFAD05A);
  static const textColor = Colors.white;
  static const searchbarColor = const Color(0xFF4F4F4F);

  static const TextStyle titleStyle = const TextStyle(
    color: textColor,
    fontSize: 48,
    fontFamily: 'JollyLodger',
    fontWeight: FontWeight.w400,
    letterSpacing: 3.0,
  );
}
