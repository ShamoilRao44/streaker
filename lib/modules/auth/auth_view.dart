// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:streaker/modules/auth/auth_vm.dart';
import 'package:streaker/resources/app_colors.dart';
import 'package:streaker/resources/app_fonts.dart';
import 'package:streaker/resources/app_images.dart';
import 'package:streaker/utils/widgets/app_text.dart';
import 'package:streaker/utils/widgets/app_textformfield.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    var wdth = MediaQuery.of(context).size.width;
    // var hght = MediaQuery.of(context).size.height;
    return GetBuilder<AuthVM>(
      builder: (c) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.backgroundColor,
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: wdth,
                  ),
                  SizedBox(height: 32),
                  Container(
                    alignment: Alignment.center,
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
                  SizedBox(height: 16),
                  AppText(
                    text: 'Persistence\nturns dreams into\nroutines.',
                    size: 30,
                    fontFamily: AppFonts.montserrat,
                    color: AppColors.textColor,
                    maxLines: 3,
                    height: 1.3,
                  ).animate(target: 2).slideY(begin: 1, end: 0, duration: 500.ms).fadeIn(duration: 1000.ms),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          c.isSignIn = true;
                          c.usernameCtrl.clear();
                          c.emailCtrl.clear();
                          c.passwordCtrl.clear();
                          c.cnfrmPswrdCtrl.clear();
                          c.update();
                        },
                        child: AppText(
                          text: 'Sign In',
                          size: 20,
                          color: c.isSignIn ? AppColors.primaryColor : AppColors.secondaryColor,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 24,
                        child: VerticalDivider(
                          width: 1,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          c.isSignIn = false;
                          c.usernameCtrl.clear();
                          c.emailCtrl.clear();
                          c.passwordCtrl.clear();
                          c.cnfrmPswrdCtrl.clear();
                          c.update();
                        },
                        child: AppText(
                          text: 'Sign up',
                          size: 20,
                          color: c.isSignIn ? AppColors.secondaryColor : AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  c.isSignIn
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Form(
                              key: c.signInFormKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    AppTextFormField(
                                      controller: c.emailCtrl,
                                      labelText: 'Email',
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter your Email!';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(height: 8),
                                    AppTextFormField(
                                      controller: c.passwordCtrl,
                                      labelText: 'Password',
                                      obscureText: c.isObscure,
                                      suffix: IconButton(
                                        onPressed: () {
                                          c.isObscure = !c.isObscure;
                                          c.update();
                                        },
                                        icon: Icon(
                                          c.isObscure ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter your password!';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(height: 8),
                                    GestureDetector(
                                      onTap: () {},
                                      child: AppText(
                                        text: 'Forgot password?',
                                        color: AppColors.accentColor,
                                        size: 12,
                                      ),
                                    ),
                                    SizedBox(height: 32),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (c.signInFormKey.currentState!.validate()) {
                                          c.login();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primaryDark,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          fixedSize: Size(280, 40)),
                                      child: AppText(
                                        text: 'Log In',
                                        size: 20,
                                        color: AppColors.primaryLight,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Form(
                                key: c.signupFormKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    AppTextFormField(
                                      controller: c.usernameCtrl,
                                      labelText: 'Username',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter a username';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(height: 8),
                                    AppTextFormField(
                                      controller: c.emailCtrl,
                                      labelText: 'Email',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter an Email';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(height: 8),
                                    AppTextFormField(
                                      controller: c.passwordCtrl,
                                      labelText: 'Password',
                                      obscureText: true,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter password!';
                                        } else if (value.length < 6) {
                                          return 'Atleast 6 characters required!';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(height: 8),
                                    AppTextFormField(
                                      controller: c.cnfrmPswrdCtrl,
                                      labelText: 'Confirm Password',
                                      obscureText: true,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter your password again!';
                                        } else if (value != c.passwordCtrl.text) {
                                          return 'Passwords do not match!';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(height: 32),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (c.signupFormKey.currentState!.validate()) {
                                          c.createAccount(context: context);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primaryDark,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          fixedSize: Size(280, 40)),
                                      child: AppText(
                                        text: 'Create Account',
                                        size: 20,
                                        color: AppColors.primaryLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
