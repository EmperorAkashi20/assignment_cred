import 'package:flutter/material.dart';

class RoundedContainerForExtraOptions extends StatelessWidget {
  const RoundedContainerForExtraOptions({
    Key? key,
    required this.windowHeight,
    required this.windowWidth,
    required this.title,
  }) : super(key: key);

  final double windowHeight;
  final double windowWidth;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: windowHeight * 0.05,
      width: windowWidth * 0.45,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey.withOpacity(0.9),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.blueGrey.withOpacity(0.9)),
        ),
      ),
    );
  }
}
