// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaker/modules/home/home_vm.dart';
import 'package:streaker/resources/app_colors.dart';
import 'package:streaker/utils/widgets/app_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(
      builder: (c) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: AppText(
                text: c.weekdayNamesList[DateTime.now().weekday - 1],
                color: AppColors.textColor,
                size: 24,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: true,
            ),
          ),
        );
      },
    );
  }
}
