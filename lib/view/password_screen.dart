import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_menu/providers/auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:restaurant_menu/components/constants.dart';

class PasswordScreen extends HookConsumerWidget {
  const PasswordScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final passwordController = useTextEditingController();
    final obscureText = useState(true);
    final errorText = useState<String?>(null);

    void toggle() {
      obscureText.value = !obscureText.value;
    }

    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF1d1e20),
              borderRadius: BorderRadius.circular(32),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            height: 360,
            width: 416,
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.lock, color: Colors.white, size: 32),
                    const SizedBox(height: 24),
                    const Text(
                      'Masukan Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: passwordController,
                      obscureText: obscureText.value,
                      validator: (value) =>
                          value!.isEmpty ? 'Password is required' : null,
                      autofocus: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF505153),
                        errorText: errorText.value,
                        suffixIcon: GestureDetector(
                          onTap: toggle,
                          child: obscureText.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Color(0xFFfbfcfc),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    MaterialButton(
                      height: 50,
                      minWidth: 103,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 24),
                      color: AppColor.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      onPressed: () async {
                        errorText.value = null;
                        if (formKey.currentState!.validate()) {
                          try {
                            await ref
                                .read(authNotifierProvider.notifier)
                                .signIn(email, passwordController.text);
                            if (context.mounted) {
                              Navigator.of(context, rootNavigator: true).pop();
                            }
                          } on AuthException catch (e) {
                            errorText.value = e.message;
                          }
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                        ),
                      ),
                    )
                  ]),
            )));
  }
}



// class PasswordScreen extends StatefulWidget {
//   const PasswordScreen({
//     super.key,
//     required this.email,
//   });

//   final String email;
//   //TODO: User location name to seach password

//   @override
//   State<PasswordScreen> createState() => _PasswordScreenState();
// }

// class _PasswordScreenState extends State<PasswordScreen> {
//   bool _obscureText = true;
//   late String passwordController;

//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(32),
//       ),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
//         height: 348,
//         width: 416,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
//               decoration: BoxDecoration(
//                 color: Color(0xFFE5E7EB),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Icon(Icons.lock, color: Colors.black, size: 32),
//             ),
//             SizedBox(height: 24),
//             Text(
//               'Masukan Password',
//               style: TextStyle(
//                 color: Color(0xFF111827),
//                 fontSize: 20,
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(height: 24),
//             TextFormField(
//               onChanged: (value) {
//                 passwordController = value;
//               },
//               obscureText: _obscureText,
//               autofocus: true,
//               decoration: InputDecoration(
//                 suffixIcon: GestureDetector(
//                   onTap: _toggle,
//                   child: _obscureText
//                       ? Icon(Icons.visibility)
//                       : Icon(Icons.visibility_off),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 hintText: 'Password',
//                 hintStyle: TextStyle(
//                   color: Color(0xFF6B7280),
//                   fontSize: 16,
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//             SizedBox(height: 24),
//             MaterialButton(
//               height: 40,
//               minWidth: 103,
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
//               color: Color(0xFFFAD05A),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(40),
//               ),
//               onPressed: () {
//                 print(passwordController);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MenuScreen(),
//                   ),
//                 );
//                 //TODO: Match the location name password with passwordController
//               },
//               child: Text(
//                 'Submit',
//                 style: TextStyle(
//                   color: Color(0xFF111827),
//                   fontSize: 16,
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w600,
//                   height: 1.25,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
