import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.locationName, this.onPressed});

  final String locationName;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 32),
        padding: const EdgeInsets.all(56),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: kWidgetColor,
        ),
        height: 280,
        width: double.infinity,
        child: Row(
          children: [
            const SizedBox(width: 25),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: kWidgetColor,
              ),
              child: const Image(
                image: AssetImage('assets/images/logoexample.png'),
              ),
            ),
            const SizedBox(width: 40),
            Text(
              locationName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
