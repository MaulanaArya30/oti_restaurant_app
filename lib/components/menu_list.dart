import 'menu_widget.dart';

class MenuList {
  List<MenuWidget> foodList = [
    MenuWidget(
      name: 'Carbonara',
      price: '999,999',
    ),
    MenuWidget(
      name: 'Menu name',
      price: '999,999',
    ),
    MenuWidget(
      name: 'Menu name',
      price: '999,999',
      isSoldOut: true,
    ),
    MenuWidget(
      name: 'Menu name',
      price: '999,999',
    ),
    MenuWidget(
      name: 'Menu name',
      price: '999,999',
    ),
    MenuWidget(
      name: 'Menu name',
      price: '999,999',
    ),
  ];

  List<MenuWidget> beverageList = [
    MenuWidget(
      name: 'Cola',
      price: '999,999',
      isSoldOut: true,
    ),
    MenuWidget(
      name: 'Menu name',
      price: '999,999',
    ),
    MenuWidget(
      name: 'Menu name',
      price: '999,999',
    ),
    MenuWidget(
      name: 'Menu name',
      price: '999,999',
    ),
    MenuWidget(
      name: 'Menu name',
      price: '999,999',
    ),
  ];

  List<MenuWidget> alcoholList = [
    MenuWidget(
      name: 'Whiskey',
      price: '999,999',
    ),
    MenuWidget(
      name: 'Menu name',
      price: '999,999',
    ),
    MenuWidget(
      name: 'Menu name',
      price: '999,999',
    ),
    MenuWidget(
      name: 'Menu name',
      price: '999,999',
      isSoldOut: true,
    ),
  ];

  List<MenuWidget> totalList = [];

  MenuList() {
    totalList.addAll(foodList);
    totalList.addAll(beverageList);
    totalList.addAll(alcoholList);
  }
}
