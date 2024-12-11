// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:streaker/resources/app_routes.dart';

class SplashVM extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.offAllNamed(AppRoutes.authView);
      },
    );
    super.onInit();
  }
}
