import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';

class MenuButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: isPressed ? appColors.buttonColor : Colors.white,
        backgroundColor: isPressed
            ? appColors.buttonColor.withOpacity(0.2)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

//color: const Color(0xFFFAD05A).withOpacity(0.2),
