import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/initial_screen_controller.dart';
import '../Device Manager/screen_constants.dart';
import '../Device Manager/text_styles.dart';
import '../WIdgets/rounded_contaner_for_extra_options.dart';
import 'initial_screen.dart';

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
      height: windowHeight * 0.72,
      decoration: BoxDecoration(
        color: const Color(0XFF1B2125),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Row(
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
                    SizedBox(
                      height: windowHeight * 0.02,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: windowHeight * 0.07,
                          width: windowWidth * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Image.network(
                              'https://staticimg.titan.co.in/Common_Assets/Logo/HDFC_Stamp.png',
                              height: windowHeight * 0.05,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: windowWidth * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'HDFC Bank',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: FontSize.s17,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '50112345019034',
                              style: TextStyle(
                                color: Colors.blueGrey.shade500,
                                fontSize: FontSize.s15,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: windowWidth * 0.2,
                        ),
                        CircleAvatar(
                          radius: windowHeight * 0.015,
                          backgroundColor: Colors.blueGrey.withOpacity(0.5),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: windowHeight * 0.02,
                    ),
                    RoundedContainerForExtraOptions(
                      windowHeight: windowHeight,
                      windowWidth: windowWidth,
                      title: "Change Account",
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    initialScreenController.isBottomSheetTwoOpen.value = false;
                  },
                  child: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.white,
                    size: windowHeight * 0.04,
                  ),
                ),
              ],
            ),
          ),
          SelectionButton(
            windowHeight: windowHeight,
            windowWidth: windowWidth,
            title: 'Select Your bank account',
          ),
        ],
      ),
    );
  }
}
