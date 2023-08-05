import 'package:flutter/foundation.dart';
import 'package:restaurant_menu/models/promos_model.dart';

import 'menu_model.dart';

class ViewModel {
  List<Category> categories;
  List<Menu> menus;
  List<Promo> promos;

  ViewModel({
    required this.categories,
    required this.menus,
    required this.promos,
  });
}
