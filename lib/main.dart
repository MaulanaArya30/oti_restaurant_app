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

  Box box = await Hive.openBox('myBox');

  await Supabase.initialize(
    url: 'https://qyqspghvjwiepnxjmhis.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF5cXNwZ2h2andpZXBueGptaGlzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTA1MjQ5NDEsImV4cCI6MjAwNjEwMDk0MX0.nGcPqXT5JwZpGV7_ZYi6Hv2JsKjnA9bwqY48UuZdxqE',
    authFlowType: AuthFlowType.pkce,
  );

  final response1 = await Supabase.instance.client.from('store').select();
  final response2 = await Supabase.instance.client.from('promos').select();
  final response3 = await Supabase.instance.client.from('menu').select();
  final response4 = await Supabase.instance.client.from('categories').select();

  final data1 = response1 as List<dynamic>;
  final data2 = response2 as List<dynamic>;
  final data3 = response3 as List<dynamic>;
  final data4 = response4 as List<dynamic>;

  final combinedData = []
    ..addAll(data1)
    ..addAll(data2)
    ..addAll(data3)
    ..addAll(data4);

  await box.put('myData', combinedData);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xFFFAD05A),
                )),
        title: 'RestaurantMenuApp',
        home: const AuthChecker());
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
