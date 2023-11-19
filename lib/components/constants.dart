import 'package:flutter/material.dart';

double kMenuScreenHeight = 0.9;

double kDefaultPadding = 60;

double kMenuPagePadding = kDefaultPadding - 15;

//double kMenuAspectRatio = 0.75;
double kMenuAspectRatio = 600 / 80;

//Color kBackgroundColor = const Color(0xFF1C1D1F);

//Color kWidgetColor = const Color(0xFF27282A);

class AppColor {
  static var backgroundColor = Color(0xFF1C1D1F);
  static var widgetColor = Color(0xFF27282A);
  static var buttonColor = Color(0xFFFAD05A);
  static var textColor = Colors.white;
  static var searchbarColor = const Color(0xFF4F4F4F);

  static TextStyle titleStyle = TextStyle(
    color: textColor,
    fontSize: 48,
    fontFamily: 'Philosopher',
    fontWeight: FontWeight.w400,
    letterSpacing: 3.0,
  );
}
