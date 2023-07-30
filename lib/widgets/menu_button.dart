import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  MenuButton({
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
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          TextButton(
            onPressed: null,
            child: Text(text),
            style: isPressed
                ? ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF009CDE)),
                  )
                : null,
          ),
          isPressed
              ? Container(
                  width: text.length * 10,
                  height: 2,
                  decoration: BoxDecoration(color: Color(0xFF009CDE)),
                )
              : Container(),
        ],
      ),
    );
  }
}
