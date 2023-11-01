import 'package:restaurant_menu/models/promos_model.dart';
import 'package:restaurant_menu/models/theme_model.dart';
import 'package:restaurant_menu/providers/hive_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

final themeResponseProvider =
    FutureProvider.autoDispose<ThemeModel?>((ref) async {
  final supabase = sb.Supabase.instance.client;
  final box = ref.read(hiveProvider);

  try {
    final themesResponse = await supabase
        .from("themes")
        .select("*")
        .maybeSingle() as Map<String, dynamic>?;

    if (themesResponse == null) {
      return null;
    }

    box.put("cachedThemeDataKey", themesResponse);

    final theme = ThemeModel.fromJson(themesResponse);

    return theme;
  } catch (error) {
    // Handle the network error here
    // You can log the error or perform any other necessary actions.

    // Try to retrieve cached data from the box
    final cachedData = box.get("cachedPromoDataKey") as Map<String, dynamic>?;

    if (cachedData != null) {
      return ThemeModel.fromJson(cachedData);
    } else {
      return null; // Return null or handle the error as needed
    }
  }
});
