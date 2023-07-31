import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/view/alcohol_screen.dart';
import 'package:restaurant_menu/view/beverages_screen.dart';
import 'package:restaurant_menu/view/food_screen.dart';
import 'package:restaurant_menu/view/promo_screen.dart';

import '../components/menu_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _index = 0;
  final screens = [
    PromoScreen(),
    FoodScreen(),
    BeveragesScreen(),
    AlcoholScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: kDefaultPadding,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                child: Column(
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(
                        color: Color(0xFF232D42),
                        fontSize: 40,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MenuButton(
                          text: 'Promo',
                          isPressed: _index == 0,
                          onTap: () {
                            setState(() {
                              _index = 0;
                            });
                          },
                        ),
                        MenuButton(
                          text: 'Food',
                          isPressed: _index == 1,
                          onTap: () {
                            setState(() {
                              _index = 1;
                            });
                          },
                        ),
                        MenuButton(
                          text: 'Beverage',
                          isPressed: _index == 2,
                          onTap: () {
                            setState(() {
                              _index = 2;
                            });
                          },
                        ),
                        MenuButton(
                          text: 'Alcohol',
                          isPressed: _index == 3,
                          onTap: () {
                            setState(() {
                              _index = 3;
                            });
                          },
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      decoration: BoxDecoration(color: Color(0xFFE5E7EB)),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              screens[_index],
            ],
          ),
        ),
      ),
    );
  }
}
