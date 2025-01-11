import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaker/resources/app_colors.dart';
import 'package:streaker/resources/app_routes.dart';
import 'package:streaker/utils/widgets/app_snackbar.dart';

class AuthVM extends GetxController {
  final FirebaseAuth appAuth = FirebaseAuth.instance;

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  bool isSignIn = true;
  bool isObscure = true;

  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController cnfrmPswrdCtrl = TextEditingController();

  //----------------------------------------------------------------------------------------------------------------------------------------------------

  Future<void> createAccount({required BuildContext context}) async {
    try {
      UserCredential userCredential = await appAuth.createUserWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      );

      User? user = userCredential.user;

      if (user != null) {
        await user.updateProfile(displayName: usernameCtrl.text);
        await user.reload();

        user.sendEmailVerification();

        appSnackbar(
          titleText: 'Verify Your Email!',
          msg: 'A verification link is sent to your Email.',
          icon: Icons.email_sharp,
        );

        appAuth.signOut();

        usernameCtrl.clear();
        emailCtrl.clear();
        passwordCtrl.clear();
        cnfrmPswrdCtrl.clear();

        isSignIn = true;

        update();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        appSnackbar(
          titleText: 'Email Already in Use',
          color: AppColors.errorColor,
        );
      } else if (e.code == 'invalid-email') {
        appSnackbar(
          titleText: 'Invalid Email',
          color: AppColors.errorColor,
        );
      } else {
        appSnackbar(titleText: 'Error', msg: e.message, color: AppColors.errorColor);
      }
    } catch (e) {
      appSnackbar(
        titleText: 'Error',
        msg: e.toString(),
        color: AppColors.errorColor,
      );
    }
  }

  //----------------------------------------------------------------------------------------------------------------------------------

  Future<void> login() async {
    try {
      UserCredential userCredential = await appAuth.signInWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text,
      );

      User? user = userCredential.user;

      if (user != null && user.emailVerified) {
        appSnackbar(titleText: 'Login successfull', msg: 'Welcome Back ${user.displayName}!');
        debugPrint('User Object: ${user.toString()}');
        Get.offAllNamed(AppRoutes.homeView);
      } else if (user != null && !user.emailVerified) {
        await appAuth.signOut();
        appSnackbar(
          titleText: 'Email not Veified!',
          msg: 'A verification link is sent to your Email address',
        );
        await user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        appSnackbar(
          titleText: "Error",
          msg: "No user found with this email.",
          color: AppColors.errorColor,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'invalid-credential') {
        appSnackbar(
          titleText: "Error",
          msg: "Incorrect Email or password.",
          color: AppColors.errorColor,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        debugPrint(e.code);
        appSnackbar(
          titleText: "Error",
          msg: "An unexpected error occurred: ${e.message}",
          snackPosition: SnackPosition.BOTTOM,
          color: AppColors.errorColor,
        );
      }
    } catch (e) {
      appSnackbar(
        titleText: "Error",
        msg: "An error occurred: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        color: AppColors.errorColor,
      );
    }
  }

  //----------------------------------------------------------------------------------------------------------------------------------------------

  Future<void> forgotPassword() async {
    final email = emailCtrl.text.trim();
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (email.isEmpty) {
      appSnackbar(
        titleText: 'Error',
        msg: 'Please enter your email address!',
        color: AppColors.errorColor,
      );
      return;
    }

    if (!emailRegex.hasMatch(email)) {
      appSnackbar(
        titleText: 'Error',
        msg: 'Please enter a valid email address!',
        color: AppColors.errorColor,
      );
      return;
    }

    try {
      await appAuth.sendPasswordResetEmail(email: email);
      appSnackbar(
        titleText: 'Password Reset',
        msg: 'A password reset link will be sent to $email, if it is Registered.',
        icon: Icons.email_outlined,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        appSnackbar(
          titleText: 'Error',
          msg: 'No user found with this email address!',
          color: AppColors.errorColor,
        );
      } else if (e.code == 'invalid-email') {
        appSnackbar(
          titleText: 'Error',
          msg: 'Invalid email address!',
          color: AppColors.errorColor,
        );
      } else {
        appSnackbar(
          titleText: 'Error',
          msg: e.message ?? 'An unexpected error occurred!',
          color: AppColors.errorColor,
        );
      }
    }
  }

  //----------------------------------------------------------------------------------------------------------------------------
}
