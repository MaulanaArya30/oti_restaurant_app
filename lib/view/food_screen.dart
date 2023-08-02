import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';
import '../components/menu_widget.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List foodList = [
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
        isSoldOut: true,
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

    return SizedBox(
      height: MediaQuery.of(context).size.height * kMenuScreenHeight,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: kMenuPagePadding)
            .copyWith(bottom: kDefaultPadding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: kMenuAspectRatio,
          crossAxisCount: 2,
        ),
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          return foodList[index];
        },
      ),
    );
  }
}
