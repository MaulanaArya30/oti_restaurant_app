import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';

import '../models/menu_model.dart';

class MenuWidget extends StatelessWidget {
  final Menu menu;

  const MenuWidget({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          margin: const EdgeInsets.all(15),
          child: PopUpMenu(menu: menu),
        ),
        menu.soldOut
            ? Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withOpacity(0.6),
                ),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: const Center(
                      child: Text(
                        'SOLD OUT',
                        style: TextStyle(
                          color: Color(0xFFA8A8A8),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({
    super.key,
    required this.menu,
  });

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: appColors.widgetColor,
                  borderRadius: BorderRadius.circular(22),
                ),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            image: NetworkImage(menu.thumbnail),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                menu.title,
                                style: const TextStyle(
                                  color: appColors.textColor,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Rp. ${menu.price}',
                                style: TextStyle(
                                  color: appColors.textColor,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: SingleChildScrollView(
                                child: Text(
                                  textAlign: TextAlign.start,
                                  'Descriptio Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in lectus vel dolor pulvinar efficitur. Sed non ligula at velit eleifend viverra eu eget sapien. Vivamus hendrerit enim vel mauris lacinia, id fringilla justo luctus. ',
                                  style: TextStyle(
                                    color: appColors.textColor.withOpacity(0.6),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Text(
                                  'Back',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: appColors.buttonColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: appColors.widgetColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              menu.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Rp. ${menu.price}',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
