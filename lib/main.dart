import 'package:assignment_cred/Router/nav_router.dart';
import 'package:assignment_cred/Router/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // This helps in using of widgets before the app has been initialized
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Get material app is used to enable the use of get as the state management package
    return GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        //This is used to make the app responsive. The breakpoints are what define when the app is supposed to change its state. This is particularly useful if the same app is being used for tabs, different sizes of mobile phones as well as the web.
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 2460,
        minWidth: 450,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "For CRED",
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //!The app opens on this screen.
      initialRoute: initialScreen,
      //!Generating all the routes. Whenever a new router is added, the app needs to be hot restarted in order to get the new router inserted.
      getPages: NavRouter.generateRoute,
    );
  }
}
