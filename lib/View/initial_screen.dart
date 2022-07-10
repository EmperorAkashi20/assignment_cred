import 'package:flutter/material.dart';

class InitalScreen extends StatelessWidget {
  const InitalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color(0XFF0E141A),
      //   automaticallyImplyLeading: false,
      //   leading: const Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 15.0),
      //     child: CircleAvatar(
      //       radius: 20,
      //       backgroundColor: Color(0XFF1B2125),
      //       child: Center(
      //         child: Icon(
      //           Icons.close,
      //           color: Colors.white,
      //           size: 30,
      //         ),
      //       ),
      //     ),
      //   ),
      //   actions: const [
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 15.0),
      //       child: CircleAvatar(
      //         radius: 20,
      //         backgroundColor: Color(0XFF1B2125),
      //         child: Icon(
      //           Icons.help_outline_outlined,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: windowHeight,
            decoration: const BoxDecoration(
              color: Color(0XFF1B2125),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: windowHeight * 0.2,
            decoration: const BoxDecoration(
              color: Color(0XFF0E141A),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(30),
              //   topRight: Radius.circular(30),
              // ),
            ),
            child: Text(
              'data',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
