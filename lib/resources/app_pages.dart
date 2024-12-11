// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:streaker/modules/auth/auth_view.dart';
import 'package:streaker/modules/home/home_view.dart';
import 'package:streaker/modules/splash/splash_view.dart';
import 'package:streaker/resources/app_routes.dart';
import 'package:streaker/utils/bindings.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splashView,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.authView,
      page: () => AuthView(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.homeView,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
