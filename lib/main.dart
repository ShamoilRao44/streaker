import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:streaker/resourses/app_pages.dart';
import 'package:streaker/resourses/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Streaker',
      initialRoute: AppRoutes.authView,
      getPages: AppPages.pages,
    );
  }
}
