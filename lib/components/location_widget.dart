import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/providers/theme_provider.dart';

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
              border: Border.all(color: theme.border, width: 1),
              borderRadius: BorderRadius.circular(32),
              color: theme.card),
          height: 220,
          width: double.infinity,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(thumbnail),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      color: theme.card),
                ),
              ),
              const SizedBox(width: 40),
              Text(
                locationName,
                style: TextStyle(
                  color: AppColor.textColor,
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
      loading: () => SizedBox.shrink(),
      error: (error, stackTrace) => Text(error.toString()),
    );
  }
}
