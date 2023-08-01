import 'package:flutter/material.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.all(25),
      height: 330,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        //color: Color(0xFFE5E7EB),
        image: DecorationImage(
          image: AssetImage('assets/images/imagepromo1.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
