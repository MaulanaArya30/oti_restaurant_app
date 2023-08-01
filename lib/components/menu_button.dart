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
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  isPressed
                      ? Container(
                          width: (text.length + 3) * 10,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Color(0xFFFAD05A).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        )
                      : Container(),
                  Text(
                    '$text',
                    style: TextStyle(
                      color: isPressed ? Color(0xFFFAD05A) : Colors.white,
                      fontSize: 16,
                      height: 1.25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
