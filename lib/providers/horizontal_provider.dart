import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final imageProvider =
    FutureProvider.autoDispose.family<ui.Image, String>((ref, url) {
  Completer<ui.Image> completer = Completer<ui.Image>();
  final image = Image.network(url);
  image.image.resolve(ImageConfiguration()).addListener(ImageStreamListener(
      (ImageInfo info, bool _) => completer.complete(info.image)));

  return completer.future;
});
