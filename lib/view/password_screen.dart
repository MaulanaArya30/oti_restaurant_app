import 'package:flutter/material.dart';

import 'menu_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({
    super.key,
    required this.location,
  });

  final String location;
  //TODO: User location name to seach password

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _obscureText = true;
  late String passwordController;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        height: 348,
        width: 416,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.lock, color: Colors.black, size: 32),
            ),
            SizedBox(height: 24),
            Text(
              'Masukan Password',
              style: TextStyle(
                color: Color(0xFF111827),
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24),
            TextFormField(
              onChanged: (value) {
                passwordController = value;
              },
              obscureText: _obscureText,
              autofocus: true,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: _toggle,
                  child: _obscureText
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 24),
            MaterialButton(
              height: 40,
              minWidth: 103,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              color: Color(0xFFFAD05A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              onPressed: () {
                print(passwordController);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuScreen(),
                  ),
                );
                //TODO: Match the location name password with passwordController
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
