import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/assets_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   _navigateToNextScreen();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsHD.background),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsHD.logo,
                    width: 400,
                    height: 400,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 140,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Colors.black26,
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),

    );

  }

  void _navigateToNextScreen()  {

        Future.delayed(const Duration(seconds: 3), () {
          Get.offAllNamed('/tutorial_home');
        });
      }

}