import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaker/modules/auth/auth_vm.dart';
import 'package:streaker/resourses/app_colors.dart';
import 'package:streaker/utils/app_text.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthVM>(
      builder: (c) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AppText(
                    text: 'Persistence\nturns Dreams\ninto Habits.',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
