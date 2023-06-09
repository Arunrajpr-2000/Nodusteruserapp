import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/screens/onboarding_screen/onboarding_one.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> gotosplashone() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.to(() => const OnboardingOne());
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      gotosplashone();
    });

    return Scaffold(
      backgroundColor: const Color(0xff537fe7),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'lib/asset/logo.png',
              width: double.infinity,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "NO DUSTER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )
          ]),
    );
  }
}
