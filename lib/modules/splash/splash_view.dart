// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaker/modules/splash/splash_vm.dart';
import 'package:streaker/resources/app_colors.dart';
import 'package:streaker/resources/app_images.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var wdth = MediaQuery.of(context).size.width;
    var hght = MediaQuery.of(context).size.height;
    return GetBuilder<SplashVM>(
      builder: (c) {
        return Container(
          width: wdth,
          height: hght,
          color: AppColors.primaryColor,
          child: Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.streakerLogo,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
