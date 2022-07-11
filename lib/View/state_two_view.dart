import 'package:assignment_cred/View/state_three_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Controller/initial_screen_controller.dart';
import '../Device Manager/text_styles.dart';
import '../WIdgets/date_card.dart';
import '../WIdgets/selection_button.dart';

class ViewTwoState extends StatelessWidget {
  final InitialScreenController initialScreenController = Get.find();
  ViewTwoState({
    Key? key,
    required this.windowHeight,
    required this.windowWidth,
  }) : super(key: key);

  final double windowHeight;
  final double windowWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0XFF1B2125),
        borderRadius: BorderRadius.circular(30),
      ),
      height: windowHeight * 0.785,
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
                          'how do you wish to repay?',
                          style: TextStyles.headingTextStyle,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: windowHeight * 0.015,
                        ),
                        Text(
                          'choose one of our recommended plans or\nmake your own',
                          style: TextStyles.subHeadingTextStyle,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        initialScreenController.isBottomSheetOneOpen.value =
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
                SizedBox(
                  height: windowHeight * 0.01,
                ),
                SizedBox(
                  height: windowHeight * 0.23,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: DataCardForList(
                          windowHeight: windowHeight,
                          windowWidth: windowWidth,
                          color: index % 2 == 0
                              ? Colors.grey.shade800.withOpacity(0.9)
                              : Colors.blueGrey.withOpacity(0.9),
                          icon: Icons.done,
                          iconColor:
                              index == 0 ? Colors.black : Colors.transparent,
                        ),
                      );
                    },
                  ),
                ),
                Container(
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
                      "Create Your Own Plan",
                      style: TextStyle(color: Colors.blueGrey.withOpacity(0.9)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SelectionButton(
            onTap: () {
              initialScreenController.isBottomSheetTwoOpen.value = true;
              debugPrint(initialScreenController.isBottomSheetOneOpen.value
                  .toString());
              showMaterialModalBottomSheet(
                bounce: true,
                enableDrag: false,
                isDismissible: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                context: context,
                builder: (BuildContext context) {
                  return StateThreeView(
                    windowHeight: windowHeight,
                    windowWidth: windowWidth,
                  );
                },
              );
            },
            windowHeight: windowHeight,
            windowWidth: windowWidth,
            title: 'Select Your bank account',
          ),
        ],
      ),
    );
  }
}
