import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/view/menu_screen.dart';

import '../components/location_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(60),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Pilih Lokasi', style: kTitleStyle),
                SizedBox(height: 48),
                LocationWidget(
                    locationName: 'Macau',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuScreen(),
                        ),
                      );
                    }),
                LocationWidget(
                  locationName: 'Hot Station',
                  onPressed: () {
                    dialogBuilder(context);
                  },
                ),
                LocationWidget(locationName: 'Vegas'),
                LocationWidget(locationName: 'Location 4'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> dialogBuilder(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          height: 400,
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
              TextField(
                obscureText: true,
                decoration: InputDecoration(
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
                color: Color(0xFFFAD05A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                onPressed: null,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// AlertDialog(
//         backgroundColor: Colors.white,
//         shape: ShapeBorder.lerp(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(32),
//           ),
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(32),
//           ),
//           1,
//         ),
//         icon: Icon(Icons.lock, color: Colors.black, size: 32),
//         title: Text(
//           'Masukan Password',
//           style: TextStyle(
//             color: Color(0xFF111827),
//             fontSize: 20,
//             fontFamily: 'Inter',
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         content: TextField(
//           obscureText: true,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(32),
//             ),
//             hintText: 'Password',
//             hintStyle: TextStyle(
//               color: Color(0xFF6B7280),
//               fontSize: 16,
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('OK'),
//           ),
//         ],
//       );
