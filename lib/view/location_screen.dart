import 'package:flutter/material.dart';
import 'package:restaurant_menu/view/menu_screen.dart';

import '../components/location_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF9FAFB),
      body: Padding(
        padding: EdgeInsets.all(60),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Select Location',
                  style: TextStyle(
                    color: Color(0xFF232D42),
                    fontSize: 40,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 48),
                LocationWidget(
                    locationName: 'Location 1',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuScreen(),
                        ),
                      );
                    }),
                LocationWidget(locationName: 'Location 2'),
                LocationWidget(locationName: 'Location 3'),
                LocationWidget(locationName: 'Location 4'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
