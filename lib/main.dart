import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_menu/providers/auth_provider.dart';
import 'package:restaurant_menu/view/location_screen.dart';
import 'package:restaurant_menu/view/menu_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('cache');

  await Supabase.initialize(
    url: 'https://qyqspghvjwiepnxjmhis.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF5cXNwZ2h2andpZXBueGptaGlzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTA1MjQ5NDEsImV4cCI6MjAwNjEwMDk0MX0.nGcPqXT5JwZpGV7_ZYi6Hv2JsKjnA9bwqY48UuZdxqE',
    authFlowType: AuthFlowType.pkce,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //     colorScheme: Theme.of(context).colorScheme.copyWith(
        //           primary: const Color(0xFFFAD05A),
        //         )),
        title: 'RestaurantMenuApp',
        home: AuthChecker());
  }
}

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    if (authState == null) {
      return const LocationScreen();
    } else {
      return const MenuScreenWithHook();
    }
  }
}
