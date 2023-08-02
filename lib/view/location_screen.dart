import 'package:flutter/material.dart';
import 'package:restaurant_menu/components/constants.dart';
import 'package:restaurant_menu/view/password_screen.dart';

import '../components/location_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  Future<void> dialogBuilder(BuildContext context, String location) {
    return showDialog(
      context: context,
      builder: (context) {
        return PasswordScreen(location: location);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List locationList = [
      LocationWidget(
        locationName: 'Macau',
        onPressed: () {
          dialogBuilder(
            context,
            'Macau',
          );
        },
      ),
      LocationWidget(
        locationName: 'Hot Station',
        onPressed: () {
          dialogBuilder(
            context,
            'Hot Station',
          );
        },
      ),
      LocationWidget(
        locationName: 'Vegas',
        onPressed: () {
          dialogBuilder(
            context,
            'Vegas',
          );
        },
      ),
      LocationWidget(
        locationName: 'Location 4',
        onPressed: () {
          dialogBuilder(
            context,
            'Location 4',
          );
        },
      ),
    ];

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(60),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('Pilih Lokasi', style: kTitleStyle),
                SizedBox(height: 48),
                Container(
                  padding: EdgeInsets.only(bottom: 60),
                  height:
                      MediaQuery.of(context).size.height * kMenuScreenHeight,
                  child: ListView.builder(
                    itemCount: locationList.length,
                    itemBuilder: (context, index) {
                      return locationList[index];
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
