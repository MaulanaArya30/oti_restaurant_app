import 'package:flutter/material.dart';

import '../widgets/promo_widget.dart';

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
      height: MediaQuery.of(context).size.height * 0.75,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30),
        itemCount: promoList.length,
        itemBuilder: (context, index) => promoList[index],
      ),
    );
  }
}
