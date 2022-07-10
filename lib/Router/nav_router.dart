import 'package:assignment_cred/Router/router_constants.dart';
import 'package:assignment_cred/View/initial_screen.dart';
import 'package:get/get.dart';

class NavRouter {
  static final generateRoute = [
    GetPage(
      name: initialScreen,
      page: () => const InitalScreen(),
    ),
  ];
}
