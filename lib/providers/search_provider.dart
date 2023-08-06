import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_menu/providers/data_provider.dart';

import '../models/menu_model.dart';

final searchBarProvider = StateProvider<String>((ref) => '');

final searchNotifierProvider =
    NotifierProvider.autoDispose<SearchNotifier, AsyncValue<List<Menu>>>(
        () => SearchNotifier());

class SearchNotifier extends AutoDisposeNotifier<AsyncValue<List<Menu>>> {
  @override
  AsyncValue<List<Menu>> build() {
    final data = ref.watch(dataProvider);
    final search = ref.watch(searchBarProvider);

    final searchedMenu = data.whenData((data) => data.menus
        .where(
            (menu) => menu.title.toLowerCase().contains(search.toLowerCase()))
        .toList());
    return searchedMenu;
  }
}
