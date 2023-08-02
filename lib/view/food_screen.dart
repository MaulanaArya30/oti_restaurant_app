import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/components/menu_list.dart';
import 'package:restaurant_menu/components/menu_widget.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuWidget> _foodList = MenuList().foodList;

    return SizedBox(
      height: MediaQuery.of(context).size.height * kMenuScreenHeight,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: kMenuPagePadding)
            .copyWith(bottom: kDefaultPadding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: kMenuAspectRatio,
          crossAxisCount: 2,
        ),
        itemCount: _foodList.length,
        itemBuilder: (context, index) {
          return _foodList[index];
        },
      ),
    );
  }
}
