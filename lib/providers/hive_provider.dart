import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

final hiveProvider = Provider((ref) {
  return Hive.box('cache');
});

final secureStorageProvider = Provider((ref) {
  return new FlutterSecureStorage();
});
