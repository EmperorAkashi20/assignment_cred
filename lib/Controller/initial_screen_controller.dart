import 'package:get/get.dart';

class InitialScreenController extends GetxController {
  RxBool isBottomSheetOneOpen = false.obs;
  RxBool isBottomSheetTwoOpen = false.obs;
  RxDouble amountValue = 100.0.obs;
}
