import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/initial_screen_controller.dart';
import '../Device Manager/text_styles.dart';
import '../WIdgets/selection_button.dart';

class StateThreeView extends StatelessWidget {
  final InitialScreenController initialScreenController = Get.find();

  StateThreeView({
    Key? key,
    required this.windowHeight,
    required this.windowWidth,
  }) : super(key: key);

  final double windowHeight;
  final double windowWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: windowHeight * 0.685,
      decoration: BoxDecoration(
        color: const Color(0XFF1B2125),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'where should we send the money?',
                          style: TextStyles.headingTextStyle,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: windowHeight * 0.015,
                        ),
                        Text(
                          'amount will be credited to this bank account,\nEMI will also be debited from this bank account',
                          style: TextStyles.subHeadingTextStyle,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        initialScreenController.isBottomSheetTwoOpen.value =
                            false;
                      },
                      child: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.white,
                        size: windowHeight * 0.04,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SelectionButton(
            onTap: () {},
            windowHeight: windowHeight,
            windowWidth: windowWidth,
            title: 'Tap for 1-click KYC',
          ),
        ],
      ),
    );
  }
}
