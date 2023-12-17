import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:restaurant_menu/models/store_model.dart';
import 'package:restaurant_menu/providers/auth_provider.dart';
import 'package:restaurant_menu/providers/hive_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import '../models/category_model.dart';
import '../models/menu_model.dart';
import '../models/promos_model.dart';
import '../models/view_model.dart';

final promoProvider = FutureProvider.autoDispose<List<Promo>>((ref) async {
  final supabase = sb.Supabase.instance.client;
  final auth = ref.watch(authNotifierProvider);
  final box = ref.read(hiveProvider);

  try {
    final promosResponse = await supabase
        .from("promos")
        .select("*")
        .eq('visible', true)
        .order('item_order', ascending: true) as List<dynamic>?;

    if (promosResponse != null) {
      box.put("cachedPromoDataKey${auth?.user.id}", promosResponse);
    }

    final promos = promosResponse?.map((e) => Promo.fromJson(e)).toList();

    return promos ?? [];
  } catch (error) {
    print("catchPROMOS");
    final cachedData =
        box.get("cachedPromoDataKey${auth?.user.id}") as List<dynamic>?;

    if (cachedData != null) {
      print("cachedData not null");
      final data = cachedData.map((e) => Promo.fromJson(e)).toList();
      return data;
    } else {
      print("cachedData  null");

      return []; // Return null or handle the error as needed
    }
  }
});

final categoryProvider =
    FutureProvider.autoDispose<List<Category>>((ref) async {
  final supabase = sb.Supabase.instance.client;
  final box = ref.read(hiveProvider);
  final auth = ref.watch(authNotifierProvider);

  try {
    final categoriesResponse = await supabase
        .from("categories")
        .select("*")
        .order('item_order', ascending: true) as List<dynamic>?;

    if (categoriesResponse != null) {
      box.put("cachedCategoryDataKey${auth?.user.id}", categoriesResponse);
    }

    final categories =
        categoriesResponse?.map((e) => Category.fromJson(e)).toList();

    // Cache the data if fetched successfully

    return categories ?? [];
  } catch (error) {
    // Handle the network error here
    // You can log the error or perform any other necessary actions.

    // Try to retrieve cached data from the box
    final cachedData =
        box.get("cachedCategoryDataKey${auth?.user.id}") as List<dynamic>?;

    if (cachedData != null) {
      return cachedData.map((e) => Category.fromJson(e)).toList();
    } else {
      return []; // Return null or handle the error as needed
    }
  }
});

final menuProvider = FutureProvider.autoDispose<List<Menu>>((ref) async {
  final supabase = sb.Supabase.instance.client;
  final box = ref.read(hiveProvider);
  final auth = ref.watch(authNotifierProvider);

  try {
    final menusResponse = await supabase
        .from("menu")
        .select("*")
        .eq('visible', true)
        .order('item_order', ascending: true) as List<dynamic>?;

    if (menusResponse != null) {
      box.put("cachedMenuDataKey${auth?.user.id}", menusResponse);
    }

    final menus = menusResponse?.map((e) => Menu.fromJson(e)).toList();

    // Cache the data if fetched successfully

    return menus ?? [];
  } catch (error) {
    // Handle the network error here
    // You can log the error or perform any other necessary actions.

    // Try to retrieve cached data from the box
    final cachedData =
        box.get("cachedMenuDataKey${auth?.user.id}") as List<dynamic>?;

    if (cachedData != null) {
      return cachedData.map((e) => Menu.fromJson(e)).toList();
    } else {
      return []; // Return null or handle the error as needed
    }
  }
});

final dataProvider = FutureProvider.autoDispose<ViewModel>((ref) async {
  final menuFuture = ref.watch(menuProvider.future);
  final categoryFuture = ref.watch(categoryProvider.future);
  final promoFuture = ref.watch(promoProvider.future);

  final [
    categories as List<Category>,
    menus as List<Menu>,
    promos as List<Promo>,
  ] = await Future.wait([
    categoryFuture,
    menuFuture,
    promoFuture,
  ]);

  await Future.wait([
    ...menus.map(
        (menu) => DefaultCacheManager().downloadFile(menu.thumbnail ?? "")),
    ...promos.map(
        (promo) => DefaultCacheManager().downloadFile(promo.thumbnail ?? ""))
  ]);

  return ViewModel(categories: categories, menus: menus, promos: promos);
});

final menuInCategoryProvider = Provider.autoDispose
    .family<AsyncValue<List<Menu>>, String>((ref, categoryId) {
  final menu = ref.watch(menuProvider);

  return menu.whenData((value) {
    final menus = value.where((element) => element.categoryId == categoryId);
    return menus.toList();
  });
});
