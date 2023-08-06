import 'package:flutter/material.dart';

import '../models/promos_model.dart';

class PromoWidget extends StatelessWidget {
  final Promo promo;

  const PromoWidget({
    super.key,
    required this.promo,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(25),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          //color: Color(0xFFE5E7EB),
          image: DecorationImage(
            image: NetworkImage(promo.thumbnail),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
