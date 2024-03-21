import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen();

    return const Scaffold(
    );

  }

  void _navigateToNextScreen() async {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed('/tutorial_home');
      });
    }
  }

