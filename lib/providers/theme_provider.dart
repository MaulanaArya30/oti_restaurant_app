import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/models/theme.dart';
import 'package:restaurant_menu/models/theme_model.dart';
import 'package:restaurant_menu/providers/hive_provider.dart';
import 'package:restaurant_menu/utils/extension.dart';
import 'package:riverpod/riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

final appThemeProvider = FutureProvider.autoDispose<AppColorTheme>((ref) async {
  debugPrint('reloading apptheme');
  final supabase = sb.Supabase.instance.client;

  final box = ref.watch(hiveProvider);

  final theme = await getTheme(supabase, box) ?? ThemeModel();
  final thumbnailUrl = await getLogoUrl(supabase, box);

  final background = theme.background;
  final foreground = theme.foreground;
  final primary = theme.primary;
  final primaryForeground = theme.primaryForeground;
  final secondary = theme.secondary;
  final secondaryForeground = theme.secondaryForeground;
  final border = theme.border;
  final card = theme.card;

  print("card $card");

  return AppColorTheme(
    logoUrl: thumbnailUrl,
    background: background != null
        ? HexColor.fromHex(background)
        : AppColor.backgroundColor,
    foreground:
        foreground != null ? HexColor.fromHex(foreground) : AppColor.textColor,
    primary: primary != null ? HexColor.fromHex(primary) : AppColor.buttonColor,
    primaryForeground: primaryForeground != null
        ? HexColor.fromHex(primaryForeground)
        : AppColor.textColor,
    secondary:
        secondary != null ? HexColor.fromHex(secondary) : AppColor.buttonColor,
    secondaryForeground: secondaryForeground != null
        ? HexColor.fromHex(secondaryForeground)
        : AppColor.textColor,
    border: border != null ? HexColor.fromHex(border) : AppColor.searchbarColor,
    card: card != null ? HexColor.fromHex(card) : AppColor.widgetColor,
  );
});

Future<String?> getLogoUrl(sb.SupabaseClient supabase, Box box) async {
  try {
    final user = supabase.auth.currentUser;
    final logoResponse = await supabase
        .from("store")
        .select("thumbnail")
        .eq('user_id', user?.id)
        .maybeSingle() as Map<String, dynamic>?;

    print(logoResponse);

    if (logoResponse == null) {
      return null;
    }

    box.put("cachedLogoDataKey", logoResponse['thumbnail']);

    final url = logoResponse['thumbnail'];

    return url;
  } catch (error) {
    final cachedData = box.get("cachedLogoDataKey") as String?;

    if (cachedData != null) {
      return cachedData;
    } else {
      return null; // Return null or handle the error as needed
    }
  }
}

Future<ThemeModel?> getTheme(sb.SupabaseClient supabase, Box box) async {
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
    final cachedData = box.get("cachedThemeDataKey") as Map<String, dynamic>?;

    if (cachedData != null) {
      return ThemeModel.fromJson(cachedData);
    } else {
      return null; // Return null or handle the error as needed
    }
  }
}
