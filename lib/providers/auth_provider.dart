import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:restaurant_menu/models/store_model.dart';
import 'package:restaurant_menu/providers/hive_provider.dart';
import 'package:restaurant_menu/providers/theme_provider.dart';
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
      _setSession(event.session);
      ref.invalidate(appThemeProvider);
    });

    ref.onDispose(() {
      authStream.cancel();
    });

    return supabase.auth.currentSession;
  }

  Future<void> signIn(String email, String password) async {
    final secureStorage = ref.watch(secureStorageProvider);
    final passwordHash = sha256.convert(utf8.encode(password));
    try {
      final authResponse = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (authResponse.session != null) {
        secureStorage.write(key: email, value: passwordHash.toString());
        secureStorage.write(
          key: _getUserKey(email),
          value: jsonEncode(authResponse.session?.toJson()),
        );
      }
    } catch (e) {
      final storedHash = await secureStorage.read(key: email);
      if (storedHash == passwordHash.toString()) {
        final userJson = await secureStorage.read(key: _getUserKey(email));
        if (userJson == null) return;
        final user = sb.Session.fromJson(json.decode(userJson));
        state = user;
      }
    }
  }

  String _getUserKey(String email) => '${email}_session';

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

  void _setSession(sb.Session? session) {
    state = session;
  }
}

final storeProvider = FutureProvider((ref) async {
  final box = ref.watch(hiveProvider);
  final supabase = sb.Supabase.instance.client;

  try {
    print("trying");
    final res = await supabase.from("store").select("*") as List<dynamic>?;
    if (res != null) {
      box.put("cachedStoreDataKey", res);
    }

    final store = res?.map((e) => StoreModel.fromJson(e)).toList();

    return store ?? [];
  } catch (e) {
    print("catched");
    final cachedData = box.get("cachedStoreDataKey") as List<dynamic>?;

    if (cachedData != null) {
      return cachedData.map((e) => StoreModel.fromJson(e)).toList();
    } else {
      return []; // Return null or handle the error as needed
    }
  }
});
