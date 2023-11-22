import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_menu/providers/theme_provider.dart';

import '../models/menu_model.dart';

class MenuWidget extends StatelessWidget {
  final Menu menu;

  const MenuWidget({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: PopUpMenu(menu: menu),
        ),
        menu.soldOut ?? false
            ? Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withOpacity(0.6),
                ),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: const Center(
                      child: Text(
                        'SOLD OUT',
                        style: TextStyle(
                          color: Color(0xFFA8A8A8),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class PopUpMenu extends ConsumerWidget {
  const PopUpMenu({
    super.key,
    required this.menu,
  });

  final Menu menu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return theme.when(
      data: (theme) => InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: theme.card,
                    border: Border.all(color: theme.border),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                              image: NetworkImage(menu.thumbnail ?? ""),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  menu.title ?? "",
                                  style: TextStyle(
                                    color: theme.foreground,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Rp. ${menu.price}',
                                  style: TextStyle(
                                    color: theme.foreground,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.only(top: 20),
                                child: SingleChildScrollView(
                                  child: Text(
                                    menu.description ?? "",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: theme.foreground.withOpacity(0.6),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: Text(
                                    'Back',
                                    style: TextStyle(
                                        fontSize: 24, color: theme.primary),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
          decoration: BoxDecoration(
              border: Border.all(color: theme.border),
              borderRadius: BorderRadius.circular(16),
              color: theme.card),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                menu.title ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Rp. ${menu.price}',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Text(error.toString()),
    );
  }
}
