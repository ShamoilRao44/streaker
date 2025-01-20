// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:streaker/resources/app_routes.dart';
import 'package:streaker/resources/app_strings.dart';
import 'package:streaker/utils/hive_utils.dart';

class SplashVM extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      Duration(seconds: 2),
      () async {
        var box = await Hive.openBox(AppStrings.hiveUserBox);

        String? uid = await box.get(HiveUserBoxKeys.uid);

        box.close();

        if (uid == null) {
          Get.offAllNamed(AppRoutes.authView);
        } else {
          Get.offAllNamed(AppRoutes.homeView);
        }
      },
    );
    super.onInit();
  }
}
