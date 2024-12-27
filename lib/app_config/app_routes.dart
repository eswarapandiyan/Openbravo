import 'package:flutter/material.dart';
import '../app_pages/index_pages.dart';

class AppRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case "splash":
          return const SplashScreen();
        case "login":
          return const LoginScreen();

        // case "otpVerification":
        //   final String mobileNo = settings.arguments as String;
        //   return OtpVerification(
        //     mobileNo: mobileNo,
        //   );
      }
      return const LoginScreen();
    });
  }
}
