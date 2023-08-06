import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import '../models/category_model.dart';
import '../models/menu_model.dart';
import '../models/promos_model.dart';
import '../models/view_model.dart';

final promoProvider = FutureProvider.autoDispose<List<Promo>>((ref) {
  final supabase = sb.Supabase.instance.client;

  return supabase.from("promos").select("*").eq('visible', true).then((value) {
    final data = value as List<dynamic>;
    final promos = data.map((e) => Promo.fromJson(e)).toList();

    return promos;
  });
});

final categoryProvider = FutureProvider.autoDispose<List<Category>>((ref) {
  final supabase = sb.Supabase.instance.client;

  return supabase.from("categories").select("*").then((value) {
    final data = value as List<dynamic>;
    final categories = data.map((e) => Category.fromJson(e)).toList();
    return categories;
  });
});

final menuProvider = FutureProvider.autoDispose<List<Menu>>((ref) {
  final supabase = sb.Supabase.instance.client;

  return supabase.from("menu").select("*").eq('visible', true).then((value) {
    final data = value as List<dynamic>;
    final menus = data.map((e) => Menu.fromJson(e)).toList();
    return menus;
  });
});

final dataProvider = FutureProvider.autoDispose<ViewModel>((ref) async {
  final menuFuture = ref.watch(menuProvider.future);
  final categoryFuture = ref.watch(categoryProvider.future);
  final promoFuture = ref.watch(promoProvider.future);

  final [categories, menus, promos] = await Future.wait([
    categoryFuture,
    menuFuture,
    promoFuture,
  ]);

  return ViewModel(
      categories: categories as List<Category>,
      menus: menus as List<Menu>,
      promos: promos as List<Promo>);
});

final menuInCategoryProvider =
    Provider.autoDispose.family<AsyncValue<List<Menu>>, int>((ref, categoryId) {
  final menu = ref.watch(menuProvider);

  return menu.whenData((value) {
    final menus = value.where((element) => element.categoryId == categoryId);
    return menus.toList();
  });
});
