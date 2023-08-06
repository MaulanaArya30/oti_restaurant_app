import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: SizedBox(
          height: 320,
          width: 320,
          child: Image(image: AssetImage('assets/images/logo.png')),
        ),
      ),
    ));
  }
}
