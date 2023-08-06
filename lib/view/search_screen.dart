import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_menu/components/menu_widget.dart';
import 'package:restaurant_menu/providers/search_provider.dart';
import '../components/constants.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchedMenu = ref.watch(searchNotifierProvider);

    return searchedMenu.when(
        data: (menus) => GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: kMenuPagePadding)
                  .copyWith(bottom: kDefaultPadding),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: kMenuAspectRatio,
                crossAxisCount: 2,
              ),
              itemCount: menus.length,
              itemBuilder: (context, index) {
                // if (widget.searchController == null) {
                //   return _totalList[index];
                // } else if (_totalList[index]
                //     .name
                //     .toLowerCase()
                //     .contains(widget.searchController!.toLowerCase())) {
                //   return _totalList[index];
                // } else {
                //   return SizedBox();
                // }
                return MenuWidget(menu: menus[index]);
              },
            ),
        error: (err, stacktrace) => Container(),
        loading: () => Center(child: CircularProgressIndicator()));
  }
}

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key, this.searchController});

//   final String? searchController;

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {


//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * kMenuScreenHeight,
//       child: GridView.builder(
//         padding: EdgeInsets.symmetric(horizontal: kMenuPagePadding)
//             .copyWith(bottom: kDefaultPadding),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           childAspectRatio: kMenuAspectRatio,
//           crossAxisCount: 2,
//         ),
//         itemCount: _totalList.length,
//         itemBuilder: (context, index) {
//           // if (widget.searchController == null) {
//           //   return _totalList[index];
//           // } else if (_totalList[index]
//           //     .name
//           //     .toLowerCase()
//           //     .contains(widget.searchController!.toLowerCase())) {
//           //   return _totalList[index];
//           // } else {
//           //   return SizedBox();
//           // }
//           return _totalList[index];
//         },
//       ),
//     );
//   }
// }
