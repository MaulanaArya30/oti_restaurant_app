import 'package:riverpod/riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as SB;

final supabaseProvider =
    Provider<SB.SupabaseClient>((ref) => SB.Supabase.instance.client);

final authStateProvider = StreamProvider((ref) {
  return ref.watch(supabaseProvider).auth.onAuthStateChange;
});

final storeProvider = FutureProvider((ref) async {
  final supabase = ref.watch(supabaseProvider);

  final res = await supabase.from("store").select("*");

  print(res);
});

final dataProvider = FutureProvider((ref) async {
  final supabase = ref.watch(supabaseProvider);

  final menusResponse = await supabase.from("menu").select("*");
  final categoriesResponse = await supabase.from("categories").select("*");
  final promosResponse = await supabase.from("promos").select("*");

  print(menusResponse);
});
