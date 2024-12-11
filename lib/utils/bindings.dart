import 'package:get/get.dart';
import 'package:streaker/modules/auth/auth_vm.dart';
import 'package:streaker/modules/home/home_vm.dart';
import 'package:streaker/modules/splash/splash_vm.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashVM());
  }
}

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthVM());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeVM());
  }
}
