import 'package:get/get.dart';
import 'package:streaker/modules/auth/auth_view.dart';
import 'package:streaker/resourses/app_bindings.dart';
import 'package:streaker/resourses/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.authView,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
