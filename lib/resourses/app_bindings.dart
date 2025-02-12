import 'package:get/get.dart';
import 'package:streaker/modules/auth/auth_vm.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthVM());
  }
}
