import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/view/alcohol_screen.dart';
import 'package:restaurant_menu/view/beverages_screen.dart';
import 'package:restaurant_menu/view/food_screen.dart';
import 'package:restaurant_menu/view/promo_screen.dart';
import 'package:restaurant_menu/view/search_screen.dart';

import '../components/menu_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? searchController;

  int _index = 0;
  final screens = [
    PromoScreen(),
    FoodScreen(),
    BeveragesScreen(),
    AlcoholScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
                      'List Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'JollyLodger',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3,
                      ),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _index = 4;
                          searchController = value;
                          screens[_index] = SearchScreen(
                            searchController: searchController,
                          );
                        });
                        print(searchController);
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.43,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Nama Menu',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Color(0xFF4F4F4F),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
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
