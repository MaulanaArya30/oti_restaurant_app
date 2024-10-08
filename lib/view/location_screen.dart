import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/providers/auth_provider.dart';
import 'package:restaurant_menu/providers/theme_provider.dart';
import 'package:restaurant_menu/view/password_screen.dart';

import '../components/location_widget.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  Future<void> dialogBuilder(BuildContext context, String email) {
    return showDialog(
      context: context,
      builder: (context) {
        return PasswordScreen(email: email);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(storeProvider);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('Pilih Lokasi', style: AppColor.titleStyle),
                const SizedBox(height: 48),
                Container(
                    padding: const EdgeInsets.only(bottom: 110),
                    height:
                        MediaQuery.of(context).size.height * kMenuScreenHeight,
                    child: store.when(
                        data: (data) {
                          return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return LocationWidget(
                                thumbnail: data[index].thumbnail ?? "",
                                onPressed: () => dialogBuilder(
                                    context, data[index].email ?? ""),
                                locationName: data[index].storeName ?? "",
                              );
                            },
                          );
                        },
                        error: (err, stacktrace) => Text(err.toString()),
                        loading: () => SizedBox.shrink())
                    // child: ListView.builder(
                    //   itemCount: locationList.length,
                    //   itemBuilder: (context, index) {
                    //     return locationList[index];
                    //   },
                    // ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
