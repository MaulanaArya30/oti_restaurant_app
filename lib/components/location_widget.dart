import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_menu/components/constants.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({required this.locationName, this.onPressed});

  final String locationName;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 32),
        padding: EdgeInsets.all(56),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: kWidgetColor,
        ),
        height: 280,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(width: 25),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: kWidgetColor,
              ),
              child: Image(
                image: AssetImage('assets/images/logoexample.png'),
              ),
            ),
            SizedBox(width: 40),
            Text(
              locationName,
              style: TextStyle(
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
