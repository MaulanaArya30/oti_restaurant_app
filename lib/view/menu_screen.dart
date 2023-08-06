import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/providers/data_provider.dart';
import 'package:restaurant_menu/providers/search_provider.dart';
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
    final selected = useState(0);

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: data.when(
            skipLoadingOnRefresh: true,
            skipLoadingOnReload: true,
            data: (data) => RefreshIndicator(
                  onRefresh: () async {
                    if (selected.value == 0)
                      ref.invalidate(promoProvider);
                    else
                      ref.invalidate(menuProvider);
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
                                const Text(
                                  'List Menu',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontFamily: 'JollyLodger',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 3,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                TextField(
                                  onChanged: (value) => ref
                                      .read(searchBarProvider.notifier)
                                      .state = value,
                                  onTap: () {
                                    selected.value = -1;
                                  },
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 1.43,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Nama Menu',
                                    hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.43,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFF4F4F4F),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
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
                                            isPressed: index == selected.value,
                                            onTap: () {
                                              selected.value = 0;
                                            },
                                          );
                                        }

                                        if (index ==
                                            data.categories.length + 1) {
                                          return MenuButton(
                                            text: 'All',
                                            isPressed: selected.value == -1,
                                            onTap: () {
                                              selected.value = -1;
                                            },
                                          );
                                        }

                                        return MenuButton(
                                          text:
                                              data.categories[index - 1].title,
                                          isPressed:
                                              data.categories[index - 1].id ==
                                                  selected.value,
                                          onTap: () {
                                            selected.value =
                                                data.categories[index - 1].id;
                                          },
                                        );
                                      })),
                                ),
                                const SizedBox(height: 12),
                              ],
                            ),
                          ),
                          (selected.value == 0)
                              ? PromoScreen(promos: data.promos)
                              : (selected.value == -1)
                                  ? const SearchScreen()
                                  : FoodScreen(categoryId: selected.value),
                          TextButton(
                              onPressed: () => {
                                    Supabase.instance.client.auth.signOut(),
                                  },
                              child: const Text('Sign Out'))
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
                )));
  }
}
// class MenuScreen extends StatefulWidget {
//   const MenuScreen({super.key});

//   @override
//   State<MenuScreen> createState() => _MenuScreenState();
// }

// class _MenuScreenState extends State<MenuScreen> {
//   String? searchController;

//   int _index = 0;
//   final screens = [
//     const PromoScreen(),
//     const FoodScreen(),
//     const BeveragesScreen(),
//     const AlcoholScreen(),
//     const SearchScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(
//                   top: kDefaultPadding,
//                   left: kDefaultPadding,
//                   right: kDefaultPadding,
//                 ),
//                 child: Column(
//                   children: [
//                     const Text(
//                       'List Menu',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 40,
//                         fontFamily: 'JollyLodger',
//                         fontWeight: FontWeight.w400,
//                         letterSpacing: 3,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     TextField(
//                       onChanged: (value) {
//                         setState(() {
//                           _index = 4;
//                         });
//                         searchController = value;
//                       },
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                         height: 1.43,
//                       ),
//                       decoration: InputDecoration(
//                         hintText: 'Nama Menu',
//                         hintStyle: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w400,
//                           height: 1.43,
//                         ),
//                         prefixIcon: const Icon(
//                           Icons.search,
//                           color: Colors.white,
//                         ),
//                         filled: true,
//                         fillColor: const Color(0xFF4F4F4F),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         MenuButton(
//                           text: 'Promo',
//                           isPressed: _index == 0,
//                           onTap: () {
//                             setState(() {
//                               _index = 0;
//                             });
//                           },
//                         ),
//                         MenuButton(
//                           text: 'Food',
//                           isPressed: _index == 1,
//                           onTap: () {
//                             setState(() {
//                               _index = 1;
//                             });
//                           },
//                         ),
//                         MenuButton(
//                           text: 'Beverage',
//                           isPressed: _index == 2,
//                           onTap: () {
//                             setState(() {
//                               _index = 2;
//                             });
//                           },
//                         ),
//                         MenuButton(
//                           text: 'Alcohol',
//                           isPressed: _index == 3,
//                           onTap: () {
//                             setState(() {
//                               _index = 3;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30),
//                   ],
//                 ),
//               ),
//               screens[_index],
//               TextButton(
//                   onPressed: () => {
//                         Supabase.instance.client.auth.signOut(),
//                       },
//                   child: const Text('Sign Out'))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
