import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/providers/horizontal_provider.dart';
import 'package:restaurant_menu/providers/theme_provider.dart';

import '../models/promos_model.dart';

class PromoWidget extends StatelessWidget {
  final Promo promo;

  const PromoWidget({
    super.key,
    required this.promo,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: PopUpPromo(promo: promo),
    );
  }
}

class PopUpPromo extends ConsumerWidget {
  const PopUpPromo({
    super.key,
    required this.promo,
  });

  final Promo promo;

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
                    color: theme.card, //theme.card,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: IconButton(
                          color: theme.foreground,
                          icon: Icon(Icons.close),
                          onPressed: () {
                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                        alignment: Alignment.topRight,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                              image: NetworkImage(promo.promoPhoto ?? ""),
                              fit: BoxFit.contain),
                        ),
                      ))
                      //const SizedBox(height: 20),
                      // Expanded(
                      //   flex: 2,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(
                      //             menu.title ?? "",
                      //             style: TextStyle(
                      //               color: theme.foreground,
                      //               fontSize: 32,
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //           Text(
                      //             'Rp. ${menu.price}',
                      //             style: TextStyle(
                      //               color: theme.foreground,
                      //               fontSize: 32,
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       Expanded(
                      //         flex: 2,
                      //         child: Container(
                      //           padding: const EdgeInsets.only(top: 20),
                      //           child: SingleChildScrollView(
                      //             child: Text(
                      //               menu.description ?? "",
                      //               textAlign: TextAlign.start,
                      //               style: TextStyle(
                      //                 color: theme.foreground.withOpacity(0.6),
                      //                 fontSize: 20,
                      //                 fontWeight: FontWeight.w500,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         flex: 2,
                      //         child: Container(
                      //           alignment: Alignment.bottomCenter,
                      //           child: InkWell(
                      //             onTap: () => Navigator.pop(context),
                      //             child: Text(
                      //               'Back',
                      //               style: TextStyle(
                      //                   fontSize: 24, color: theme.primary),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.all(25),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            //color: Color(0xFFE5E7EB),
            image: DecorationImage(
              image: NetworkImage(promo.thumbnail ?? ""),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
