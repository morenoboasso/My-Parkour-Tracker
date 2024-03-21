
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/splash_screen.dart';
import '../pages/tutorial/tutorial_home.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: '/splashscreen',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/tutorial_home',
      page: () => const TutorialHome(),
    ),
  ];
}