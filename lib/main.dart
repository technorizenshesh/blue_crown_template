import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:blue_crown_template/common/common_methods.dart';
import 'package:blue_crown_template/common/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CommonMethods.unFocsKeyBoard();
  runApp(
    GetMaterialApp(
      title: "Blue Crown",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: MThemeData.themeData(),
    ),
  );
}

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return;
  }
}*/
