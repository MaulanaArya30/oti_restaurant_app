import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/providers/data_provider.dart';
import 'package:restaurant_menu/providers/search_provider.dart';
import 'package:restaurant_menu/providers/theme_provider.dart';
import 'package:restaurant_menu/utils/extension.dart';
import 'package:restaurant_menu/view/food_screen.dart';
import 'package:restaurant_menu/view/promo_screen.dart';
import 'package:restaurant_menu/view/search_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../components/menu_button.dart';

class MenuScreenWithHook extends HookConsumerWidget {
  const MenuScreenWithHook({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataProvider);
    final selected = useState('0');
    final theme = ref.watch(appThemeProvider);

    return theme.when(
        data: (theme) => Scaffold(
            backgroundColor: theme.background,
            body: data.when(
                skipLoadingOnRefresh: true,
                skipLoadingOnReload: true,
                data: (data) => RefreshIndicator(
                      onRefresh: () async {
                        if (selected.value == '0') {
                          ref.invalidate(promoProvider);
                        } else {
                          ref.invalidate(menuProvider);
                        }
                      },
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
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
                                    // Text(
                                    //   'List Menu',
                                    //   style: TextStyle(
                                    //     color: Colors.white, //theme.foreground,
                                    //     fontSize: 40,
                                    //     fontFamily: 'JollyLodger',
                                    //     fontWeight: FontWeight.w400,
                                    //     letterSpacing: 3,
                                    //   ),
                                    // ),
                                    Image.asset(
                                      'assets/images/logonew.png',
                                      width: 120,
                                      height: 120,
                                    ),
                                    const SizedBox(height: 12),
                                    TextField(
                                      onChanged: (value) => ref
                                          .read(searchBarProvider.notifier)
                                          .state = value,
                                      onTap: () {
                                        selected.value = '-1';
                                      },
                                      style: TextStyle(
                                        color: theme.foreground,
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 1.43,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Nama Menu',
                                        hintStyle: TextStyle(
                                          color: theme.foreground,
                                          fontSize: 18,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 1.43,
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Icon(Icons.search,
                                              size: 40,
                                              color: theme.foreground),
                                        ),
                                        filled: true,
                                        fillColor: theme.border,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(80),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    SizedBox(
                                      height: 44,
                                      child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(width: 20),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: data.categories.length + 2,
                                          itemBuilder: ((context, index) {
                                            if (index == 0) {
                                              return MenuButton(
                                                text: 'Promo',
                                                isPressed: index.toString() ==
                                                    selected.value,
                                                onTap: () {
                                                  selected.value = '0';
                                                },
                                              );
                                            }

                                            if (index ==
                                                data.categories.length + 1) {
                                              return MenuButton(
                                                text: 'All',
                                                isPressed:
                                                    selected.value == '-1',
                                                onTap: () {
                                                  selected.value = '-1';
                                                },
                                              );
                                            }

                                            return MenuButton(
                                              text: data.categories[index - 1]
                                                      .title ??
                                                  "",
                                              isPressed: data
                                                      .categories[index - 1]
                                                      .id ==
                                                  selected.value,
                                              onTap: () {
                                                selected.value = data
                                                        .categories[index - 1]
                                                        .id ??
                                                    "";
                                              },
                                            );
                                          })),
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                ),
                              ),
                              (selected.value == '0')
                                  ? PromoScreen(promos: data.promos)
                                  : (selected.value == '-1')
                                      ? const SearchScreen()
                                      : FoodScreen(categoryId: selected.value),
                              TextButton(
                                  onPressed: () => {
                                        Supabase.instance.client.auth.signOut(),
                                      },
                                  child: Text(
                                    'Sign Out',
                                    style: TextStyle(
                                      color: AppColor.buttonColor,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                error: (err, stacktrace) {
                  return Container();
                },
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ))),
        error: (err, stacktrace) {
          return Container();
        },
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
