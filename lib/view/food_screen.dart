import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/components/menu_widget.dart';
import 'package:restaurant_menu/providers/data_provider.dart';

class FoodScreen extends ConsumerWidget {
  final int categoryId;

  const FoodScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menus = ref.watch(menuInCategoryProvider(categoryId));

    return menus.when(
      data: (data) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: kMenuPagePadding)
              .copyWith(bottom: kDefaultPadding),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: kMenuAspectRatio,
            crossAxisCount: 1,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return MenuWidget(menu: data[index]);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stacktrace) => Text(err.toString()),
    );
  }
}
