import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/menu_widget.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List foodList = [
      MenuWidget(),
      MenuWidget(),
      MenuWidget(),
      MenuWidget(),
      MenuWidget(),
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: 20, right: 20, left: 20, top: 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 4,
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
