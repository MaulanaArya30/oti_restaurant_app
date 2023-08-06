import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/models/promos_model.dart';

import '../components/promo_widget.dart';

class PromoScreen extends StatelessWidget {
  final List<Promo> promos;

  const PromoScreen({super.key, required this.promos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding)
          .copyWith(bottom: kDefaultPadding),
      itemCount: promos.length,
      itemBuilder: (context, index) => PromoWidget(
        promo: promos[index],
      ),
    );
  }
}
