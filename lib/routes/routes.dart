import 'package:codingchallenge/views/home/home_view.dart';
import 'package:codingchallenge/views/splash/splash_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String splash = "/";
  static String homescreen = "/HomeScreen";
  static List<GetPage<dynamic>> routes = [
    // Splash Screen
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: homescreen,
      page: () => HomeScreen(),
    ),
  ];
}
