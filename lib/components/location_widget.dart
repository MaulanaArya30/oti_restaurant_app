import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({required this.locationName, this.onPressed});

  final String locationName;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0XFFE5E7EB),
      ),
      height: 180,
      width: double.infinity,
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            SizedBox(width: 25),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              child: Image(
                image: AssetImage('assets/images/pic.png'),
              ),
            ),
            SizedBox(width: 45),
            Text(
              locationName,
              style: TextStyle(
                color: Color(0xFF232D42),
                fontSize: 25,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
