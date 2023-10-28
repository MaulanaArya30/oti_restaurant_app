import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_menu/components/constants.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget(
      {super.key,
      required this.locationName,
      this.onPressed,
      required this.thumbnail});

  final String locationName;
  final VoidCallback? onPressed;
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 32),
        padding: const EdgeInsets.all(56),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: kWidgetColor,
        ),
        height: 280,
        width: double.infinity,
        child: Row(
          children: [
            const SizedBox(width: 25),
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  color: kWidgetColor,
                ),
              ),
            ),
            const SizedBox(width: 40),
            Text(
              locationName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> getYourCachedDataFromHive() async {
  final box = await Hive.openBox('myBox');
  final cachedData = box.get('myData') as List<dynamic>;
  return cachedData;
}
