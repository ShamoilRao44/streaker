// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaker/resources/app_colors.dart';
import 'package:streaker/utils/widgets/app_text.dart';

SnackbarController appSnackbar({
  String? titleText,
  String? msg,
  Color? color,
  IconData? icon,
  SnackPosition? snackPosition,
}) {
  return Get.snackbar(
    '',
    '',
    titleText: AppText(
      text: titleText ?? "",
      color: color == AppColors.errorColor ? AppColors.textColor2 : AppColors.textColor,
      size: 18,
    ),
    messageText: AppText(
      text: msg ?? "",
      color: color == AppColors.errorColor ? AppColors.textColor2 : AppColors.textColor,
      size: 14,
      maxLines: 2,
    ),
    icon: icon != null
        ? Icon(
            icon,
            size: 18,
            color: AppColors.textColor,
          )
        : null,
    backgroundColor: color ?? AppColors.primaryLight,
    snackPosition: snackPosition ?? SnackPosition.TOP,
    maxWidth: 280,
    margin: EdgeInsets.all(16),
  );
}
