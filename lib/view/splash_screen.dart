import 'package:flutter/material.dart';
import 'package:restaurant_menu/view/location_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LocationScreen(),
            ),
          );
        },
        child: Center(
          child: Container(
            height: 320,
            width: 320,
            color: Color(0xFFE5E7EB),
            child: Center(
              child: Image(image: AssetImage('assets/images/pic.png')),
            ),
          ),
        ),
      ),
    );
  }
}
