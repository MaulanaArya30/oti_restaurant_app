import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/providers/theme_provider.dart';
import 'package:restaurant_menu/utils/extension.dart';

class MenuButton extends ConsumerWidget {
  const MenuButton({
    super.key,
    this.isPressed = false,
    required this.text,
    this.onTap,
  });

  final bool isPressed;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return theme.when(
      data: (theme) => TextButton(
        style: TextButton.styleFrom(
          foregroundColor: isPressed ? theme.primary : Colors.white,
          backgroundColor:
              isPressed ? theme.primary.withOpacity(0.2) : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
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

//color: const Color(0xFFFAD05A).withOpacity(0.2),
