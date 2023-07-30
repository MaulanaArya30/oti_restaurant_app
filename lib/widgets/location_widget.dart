import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({required this.locationName, this.onPressed});

  final String locationName;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      padding: EdgeInsets.all(10),
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
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFE5E7EB),
              ),
              child: Image(
                image: AssetImage('assets/images/pic.png'),
              ),
            ),
            SizedBox(width: 25),
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
