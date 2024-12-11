// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streaker/resources/app_fonts.dart';
import 'package:streaker/utils/widgets/app_text.dart';

import '../../resources/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? required;
  final int? maxLines;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final Color? fontColor;
  final double? fontSize;
  final String? fontFamily;
  final String? hintText;
  final FontWeight? fontWeight;
  final Widget? prefix;
  final Widget? suffix;
  final bool? enabled;
  final bool? isCollapsed;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;

  const AppTextFormField({
    this.labelText,
    this.controller,
    this.obscureText,
    this.keyboardType,
    this.required,
    this.maxLines,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.disabledBorderColor,
    this.enabled,
    this.fontColor,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.prefix,
    this.isCollapsed,
    this.suffix,
    this.onChanged,
    this.inputFormatters,
    this.hintText,
    this.validator,
    this.maxLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        maxLines: maxLines == null ? 1 : maxLines!,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType ?? TextInputType.name,
        enabled: enabled ?? true,
        cursorColor: AppColors.textColor,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        style: TextStyle(
          color: fontColor ?? AppColors.textColor,
          fontFamily: fontFamily ?? AppFonts.montserrat,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? 14,
        ),
        decoration: InputDecoration(
          isCollapsed: isCollapsed ?? false,
          counterText: '',
          hintText: hintText ?? '',
          hintStyle: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 14,
            fontFamily: AppFonts.montserrat,
            fontWeight: FontWeight.normal,
          ),
          label: labelText != null && labelText!.isNotEmpty
              ? AppText(
                  text: labelText!,
                  size: 14,
                )
              : null,
          floatingLabelStyle: TextStyle(
            color: AppColors.primaryColor,
          ),
          hoverColor: AppColors.secondaryColor,
          alignLabelWithHint: true,
          filled: false,
          prefix: prefix,
          suffix: suffix,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: enabledBorderColor ?? AppColors.secondaryColor),
            borderRadius: BorderRadius.circular(0),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: enabledBorderColor ?? AppColors.secondaryColor),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: enabledBorderColor ?? AppColors.primaryColor),
            borderRadius: BorderRadius.circular(0),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: enabledBorderColor ?? AppColors.errorColor),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: enabledBorderColor ?? AppColors.errorColor),
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onChanged: onChanged,
        validator: validator);
  }
}
