import 'package:flutter/widgets.dart';

class AppColorTheme {
  String? logoUrl;
  Color background;
  Color foreground;
  Color primary;
  Color primaryForeground;
  Color secondary;
  Color secondaryForeground;
  Color border;
  Color card;

  AppColorTheme(
      {required this.background,
      required this.foreground,
      required this.primary,
      required this.primaryForeground,
      required this.secondary,
      required this.secondaryForeground,
      required this.border,
      required this.card,
      required this.logoUrl});
}
