import 'package:assignment_cred/Device%20Manager/screen_constants.dart';
import 'package:assignment_cred/Device%20Manager/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../Controller/initial_screen_controller.dart';

class InitalScreen extends StatelessWidget {
  const InitalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InitialScreenController initialScreenController =
        Get.put(InitialScreenController());
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: windowHeight,
            decoration: const BoxDecoration(
              color: Color(0XFF0E141A),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0XFF1B2125),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0XFF1B2125),
                    child: Center(
                      child: Icon(
                        Icons.help_outline_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: windowHeight * 0.87,
            decoration: const BoxDecoration(
              color: Color(0XFF1B2125),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 25),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          initialScreenController.isBottomSheetOneOpen.value ==
                                  false
                              ? Text(
                                  'Name, How much do you need?',
                                  style: TextStyles.headingTextStyle,
                                  textAlign: TextAlign.left,
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Credit Amount",
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: windowWidth * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "₹ " +
                                          initialScreenController
                                              .amountValue.value
                                              .toStringAsFixed(2)
                                              .replaceAllMapped(
                                                  RegExp(
                                                      r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                  (Match m) => '${m[1]},'),
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: windowWidth * 0.04,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                          SizedBox(
                            height: windowHeight * 0.01,
                          ),
                          Text(
                            'Move the dial and set the amount you need,\nUpto ₹4,28,879.00',
                            style: TextStyles.subHeadingTextStyle,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: windowWidth * 0.85,
                  height: windowHeight * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      SleekCircularSlider(
                        initialValue: 100,
                        min: 100,
                        max: 4288792,
                        appearance: CircularSliderAppearance(
                          customWidths: CustomSliderWidths(
                            progressBarWidth: windowWidth * 0.05,
                            trackWidth: windowWidth * 0.03,
                            shadowWidth: windowWidth * 0.02,
                            handlerSize: windowWidth * 0.01,
                          ),
                          customColors: CustomSliderColors(
                            trackColor: Colors.orange.withOpacity(0.2),
                            progressBarColor: Colors.green,
                            dotColor: Colors.white,
                          ),
                          startAngle: 270,
                          angleRange: 360,
                          infoProperties: InfoProperties(
                            modifier: changePercentToRupee,
                            mainLabelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: windowWidth * 0.07,
                              fontWeight: FontWeight.bold,
                            ),
                            topLabelText: 'credit amount',
                            topLabelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: windowWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                            bottomLabelText: '@1.4% monthly',
                            bottomLabelStyle: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: windowWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          size: windowHeight * 0.3,
                        ),
                        onChange: (double value) {
                          debugPrint(value.toString());
                        },
                        onChangeEnd: (double value) {
                          initialScreenController.amountValue.value = value;
                          return;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: Text(
                          'stash is instant. money will be credited within seconds',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: windowWidth * 0.04,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      initialScreenController.isBottomSheetOneOpen.value = true;
                      debugPrint(initialScreenController
                          .isBottomSheetOneOpen.value
                          .toString());
                      showMaterialModalBottomSheet(
                        bounce: true,
                        enableDrag: false,
                        isDismissible: false,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        context: context,
                        builder: (BuildContext context) {
                          return ViewTwoState(
                            windowHeight: windowHeight,
                            windowWidth: windowWidth,
                          );
                        },
                      );
                    },
                    child: SelectionButton(
                      windowHeight: windowHeight,
                      windowWidth: windowWidth,
                      title: "Proceed to EMI selection",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String changePercentToRupee(double value) {
    final roundedValue = value.ceil().toInt().toString();
    return '₹ $roundedValue'.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({
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
    );
  }
}

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
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          initialScreenController.isBottomSheetTwoOpen.value ==
                                  false
                              ? Text(
                                  'how do you wish to repay?',
                                  style: TextStyles.headingTextStyle,
                                  textAlign: TextAlign.left,
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'EMI',
                                          style: TextStyles.headingTextStyle,
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          '₹ 3,000 /mo',
                                          style: TextStyles.headingTextStyle,
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: windowWidth * 0.2,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'EMI',
                                          style: TextStyles.headingTextStyle,
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          '₹ 3,000 /mo',
                                          style: TextStyles.headingTextStyle,
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ],
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
          GestureDetector(
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
            windowHeight: windowHeight,
            windowWidth: windowWidth,
            title: 'Select Your bank account',
          ),
        ],
      ),
    );
  }
}

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
