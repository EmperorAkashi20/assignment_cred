import 'package:flutter/material.dart';

import '../Device Manager/screen_constants.dart';

class DataCardForList extends StatelessWidget {
  const DataCardForList({
    Key? key,
    required this.windowHeight,
    required this.windowWidth,
    required this.color,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  final double windowHeight;
  final double windowWidth;
  final Color color;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: windowHeight * 0.2,
        width: windowWidth * 0.38,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Center(
                  child: Icon(
                    icon,
                    color: iconColor,
                  ),
                ),
              ),
              SizedBox(
                height: windowHeight * 0.03,
              ),
              Row(
                children: [
                  Text(
                    '₹1000 ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/ mo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSize.s14,
                    ),
                  ),
                ],
              ),
              Text(
                'for 12 months',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.s14,
                ),
              ),
              SizedBox(
                height: windowHeight * 0.01,
              ),
              Text(
                'See Calculations',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: FontSize.s14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
