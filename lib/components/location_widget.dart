import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/providers/theme_provider.dart';
import 'package:restaurant_menu/utils/extension.dart';

class LocationWidget extends ConsumerWidget {
  const LocationWidget(
      {super.key,
      required this.locationName,
      this.onPressed,
      required this.thumbnail});

  final String locationName;
  final VoidCallback? onPressed;
  final String thumbnail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return theme.when(
      data: (theme) => GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.only(bottom: 32),
          padding: const EdgeInsets.all(56),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32), color: theme.card),
          height: 280,
          width: double.infinity,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(thumbnail),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      color: theme.card),
                ),
              ),
              const SizedBox(width: 40),
              Text(
                locationName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.20,
                ),
              ),
            ],
          ),
        ),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Text(error.toString()),
    );
  }
}
