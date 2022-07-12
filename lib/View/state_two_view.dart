import 'dart:async';

import 'package:assignment_cred/View/state_three_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Controller/initial_screen_controller.dart';
import '../Device Manager/text_styles.dart';
import '../WIdgets/date_card.dart';
import '../WIdgets/rounded_contaner_for_extra_options.dart';
import 'initial_screen.dart';

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
    return AnimatedContainer(
      duration: const Duration(seconds: 30),
      curve: Curves.fastLinearToSlowEaseIn,
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
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedCrossFade(
                            duration: const Duration(milliseconds: 300),
                            firstChild: Text(
                              'how do you wish to repay?',
                              style: TextStyles.headingTextStyle,
                              textAlign: TextAlign.left,
                            ),
                            secondChild: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'EMI',
                                      style: TextStyles.subHeadingTextStyle,
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '₹3,000 /mo',
                                      style: TextStyles.headingTextStyle,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: windowWidth * 0.2,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'duration',
                                      style: TextStyles.subHeadingTextStyle,
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '12 months',
                                      style: TextStyles.headingTextStyle,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            crossFadeState: initialScreenController
                                        .isBottomSheetTwoOpen.value ==
                                    false
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
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
                RoundedContainerForExtraOptions(
                  windowHeight: windowHeight,
                  windowWidth: windowWidth,
                  title: "Or Create Your Own",
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              Timer(const Duration(seconds: 0), () {
                Get.isDialogOpen ?? true
                    ? const Offstage()
                    : Get.dialog(
                        Center(
                          child: LoadingAnimationWidget.inkDrop(
                            size: 50,
                            color: Colors.orange.withOpacity(0.9),
                          ),
                        ),
                        barrierDismissible: false);
              });

              await Future.delayed(
                const Duration(milliseconds: 500),
              );
              if (Get.isDialogOpen ?? false) Get.back();
              initialScreenController.isBottomSheetTwoOpen.value = true;
              debugPrint(initialScreenController.isBottomSheetOneOpen.value
                  .toString());
              showMaterialModalBottomSheet(
                animationCurve: Curves.easeInBack,
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
            child: SelectionButton(
              windowHeight: windowHeight,
              windowWidth: windowWidth,
              title: 'Select Your bank account',
            ),
          ),
        ],
      ),
    );
  }
}
