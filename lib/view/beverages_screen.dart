import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/components/menu_list.dart';
import 'package:restaurant_menu/components/menu_widget.dart';

class BeveragesScreen extends StatelessWidget {
  const BeveragesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuWidget> _beverageList = MenuList().beverageList;

    return SizedBox(
      height: MediaQuery.of(context).size.height * kMenuScreenHeight,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: kMenuPagePadding)
            .copyWith(bottom: kDefaultPadding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: kMenuAspectRatio,
          crossAxisCount: 2,
        ),
        itemCount: _beverageList.length,
        itemBuilder: (context, index) {
          return _beverageList[index];
        },
      ),
    );
  }
}
