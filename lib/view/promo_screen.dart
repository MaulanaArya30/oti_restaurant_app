import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';

import '../components/promo_widget.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List promoList = [
      PromoWidget(),
      PromoWidget(),
      PromoWidget(),
      PromoWidget(),
      PromoWidget(),
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding)
            .copyWith(bottom: kDefaultPadding),
        itemCount: promoList.length,
        itemBuilder: (context, index) => promoList[index],
      ),
    );
  }
}
