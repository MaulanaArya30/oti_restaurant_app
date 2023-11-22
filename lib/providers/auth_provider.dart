import 'package:restaurant_menu/models/store_model.dart';
import 'package:riverpod/riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

final authNotifierProvider = NotifierProvider<AuthNotifier, sb.Session?>(
  () => AuthNotifier(),
);

class AuthNotifier extends Notifier<sb.Session?> {
  final supabase = sb.Supabase.instance.client;

  @override
  sb.Session? build() {
    final authStream = supabase.auth.onAuthStateChange.listen((event) {
      setSession(event.session);
    });

    ref.onDispose(() {
      authStream.cancel();
    });

    return supabase.auth.currentSession;
  }

  void setSession(sb.Session? session) {
    state = session;
  }

  Future<void> signIn(String email, String password) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  Future<bool> checkPassword(String email, String password) async {
    final res = await supabase.auth
        .signInWithPassword(email: email, password: password);
    if (res.session == null) {
      return false;
    } else {
      return true;
    }
  }
}

final storeProvider = FutureProvider((ref) async {
  final supabase = sb.Supabase.instance.client;

  final res = await supabase.from("store").select("*") as List<dynamic>;

  final store = res.map((e) => StoreModel.fromJson(e)).toList();

  return store;
});
