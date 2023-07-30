import 'package:flutter/material.dart';

import '../widgets/menu_widget.dart';

class AlcoholScreen extends StatelessWidget {
  const AlcoholScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List alcoholList = [
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
        itemCount: alcoholList.length,
        itemBuilder: (context, index) {
          return alcoholList[index];
        },
      ),
    );
  }
}
