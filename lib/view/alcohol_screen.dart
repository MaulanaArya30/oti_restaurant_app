import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';

import '../components/menu_widget.dart';

class AlcoholScreen extends StatelessWidget {
  const AlcoholScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List alcoholList = [
      MenuWidget(
        name: 'menu name',
        price: '999,999',
      ),
      MenuWidget(
        name: 'menu name',
        price: '999,999',
      ),
      MenuWidget(
        name: 'menu name',
        price: '999,999',
      ),
      MenuWidget(
        name: 'menu name',
        price: '999,999',
      ),
    ];

    return Container(
      height: MediaQuery.of(context).size.height * kMenuScreenHeight,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: kMenuPagePadding)
            .copyWith(bottom: kDefaultPadding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: kMenuAspectRatio,
          crossAxisCount: 2,
        ),
        itemCount: alcoholList.length,
        itemBuilder: (context, index) {
          return alcoholList[index];
        },
      ),
    );
  }
}
