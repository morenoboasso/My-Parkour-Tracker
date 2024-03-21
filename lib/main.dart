import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myparkourtracker/routes/routes.dart';


void main() {
  runApp(const MyAppSplash());
}

class MyAppSplash extends StatelessWidget {
  const MyAppSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: '/splashscreen',
      getPages: AppPages.routes,
    );
  }
}
