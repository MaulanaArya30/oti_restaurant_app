import 'package:flutter/material.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFE5E7EB),
      ),
      child: Center(child: Text('Promo Widget')),
    );
  }
}
