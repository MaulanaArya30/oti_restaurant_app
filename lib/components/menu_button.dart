import 'package:flutter/material.dart';

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
        foregroundColor: isPressed ? const Color(0xFFFAD05A) : Colors.white,
        backgroundColor: isPressed
            ? const Color(0xFFFAD05A).withOpacity(0.2)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: onTap,
      child: Text(text),
    );
  }
}

//color: const Color(0xFFFAD05A).withOpacity(0.2),
