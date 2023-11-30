import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/providers/auth_provider.dart';
import 'package:restaurant_menu/providers/data_provider.dart';
import 'package:restaurant_menu/providers/search_provider.dart';
import 'package:restaurant_menu/providers/theme_provider.dart';
import 'package:restaurant_menu/view/food_screen.dart';
import 'package:restaurant_menu/view/password_screen.dart';
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
    final auth = ref.watch(authNotifierProvider);
    final store = ref.watch(storeProvider);

    return theme.when(
        data: (theme) => Scaffold(
            backgroundColor: theme.background,
            body: data.when(
                skipLoadingOnRefresh: true,
                skipLoadingOnReload: true,
                data: (data) => RefreshIndicator(
                      onRefresh: () async {
                        ref.invalidate(appThemeProvider);
                        if (selected.value == '0') {
                          ref.invalidate(promoProvider);
                        } else {
                          ref.invalidate(menuProvider);
                        }
                      },
                      child: Stack(
                        children: [
                          Center(
                            child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  theme.background.withOpacity(0.9),
                                  BlendMode.srcOver,
                                ),
                                child: store.when(
                                    data: (store) => Image.network(
                                        store
                                                .where((element) {
                                                  return element.userId ==
                                                      auth?.user.id;
                                                })
                                                .firstOrNull
                                                ?.thumbnail ??
                                            "",
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        fit: BoxFit.cover),
                                    error: (error, stackTrace) =>
                                        SizedBox.shrink(),
                                    loading: () => SizedBox.shrink())),
                          ),
                          SingleChildScrollView(
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
                                        store.when(
                                            data: (store) => Image.network(
                                                store
                                                        .where((element) {
                                                          return element
                                                                  .userId ==
                                                              auth?.user.id;
                                                        })
                                                        .firstOrNull
                                                        ?.thumbnail ??
                                                    "",
                                                width: 96,
                                                height: 96,
                                                fit: BoxFit.cover),
                                            error: (error, stackTrace) =>
                                                SizedBox.shrink(),
                                            loading: () => SizedBox.shrink()),
                                        const SizedBox(height: 24),
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
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'Nama Menu',
                                            hintStyle: TextStyle(
                                              color: theme.foreground,
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 24, right: 16),
                                              child: Icon(Icons.search,
                                                  size: 24,
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
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(width: 20),
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  data.categories.length + 2,
                                              itemBuilder: ((context, index) {
                                                if (index == 0) {
                                                  return MenuButton(
                                                    text: 'Promo',
                                                    isPressed:
                                                        index.toString() ==
                                                            selected.value,
                                                    onTap: () {
                                                      selected.value = '0';
                                                    },
                                                  );
                                                }

                                                if (index ==
                                                    data.categories.length +
                                                        1) {
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
                                                  text: data
                                                          .categories[index - 1]
                                                          .title ??
                                                      "",
                                                  isPressed: data
                                                          .categories[index - 1]
                                                          .id ==
                                                      selected.value,
                                                  onTap: () {
                                                    selected.value = data
                                                            .categories[
                                                                index - 1]
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
                                          : FoodScreen(
                                              categoryId: selected.value),
                                  SizedBox(height: 24),
                                ],
                              ),
                            ),
                          ),
                        ],
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

class CheckPassword extends HookConsumerWidget {
  const CheckPassword({super.key, required this.email, this.submit});

  final String email;
  final Function()? submit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final theme = ref.watch(appThemeProvider);

    final passwordController = useTextEditingController();
    final obscureText = useState(true);
    final errorText = useState<String?>(null);

    void toggle() {
      obscureText.value = !obscureText.value;
    }

    return theme.when(
      data: (theme) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
              decoration: BoxDecoration(
                color: theme.background,
                border: Border.all(color: theme.border),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              height: 280,
              width: 480,
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Masukan Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: passwordController,
                        obscureText: obscureText.value,
                        validator: (value) =>
                            value!.isEmpty ? 'Password is required' : null,
                        autofocus: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF505153),
                          errorText: errorText.value,
                          suffixIcon: GestureDetector(
                            onTap: toggle,
                            child: obscureText.value
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Color(0xFFfbfcfc),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.bottomRight,
                        child: MaterialButton(
                          height: 50,
                          minWidth: 103,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 24),
                          color: theme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          onPressed: submit ??
                              () async {
                                errorText.value = null;
                                if (formKey.currentState!.validate()) {
                                  try {
                                    final check = await ref
                                        .read(authNotifierProvider.notifier)
                                        .checkPassword(
                                            email, passwordController.text);

                                    if (check) {
                                      ref
                                          .read(authNotifierProvider.notifier)
                                          .signOut();
                                      if (context.mounted) {
                                        Navigator.of(context).pop();
                                      }
                                    } else {
                                      if (context.mounted) {
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  } on AuthException catch (e) {
                                    errorText.value = e.message;
                                  }
                                }
                              },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Color(0xFF111827),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 1.25,
                            ),
                          ),
                        ),
                      )
                    ]),
              ))),
      error: (error, stackTrace) => SizedBox.shrink(),
      loading: () => SizedBox.shrink(),
    );
  }
}
