import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  const SelectionButton({
    Key? key,
    required this.windowHeight,
    required this.windowWidth,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final double windowHeight;
  final double windowWidth;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        height: windowHeight * 0.08,
        width: windowWidth,
        decoration: BoxDecoration(
          color: Colors.blue.shade800,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: windowWidth * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
