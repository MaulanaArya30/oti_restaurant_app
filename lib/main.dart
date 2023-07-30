import 'package:flutter/material.dart';
import 'package:restaurant_menu/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RestaurantMenuApp',
      home: SafeArea(
        child: SplashScreen(),
      ),
    );
  }
}
