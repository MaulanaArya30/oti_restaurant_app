import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFE5E7EB),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text('Menu 1'),
                Text('Rp. 20,000,000'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
