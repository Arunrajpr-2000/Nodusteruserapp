import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noduster/common/snackbar.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/controller/dependency/dependency.dart';
import 'package:noduster/screens/onboarding_screen/widgets/onboarding_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final ctx = Get.context;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              kheight20,
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/asset/onboard1background.png'),
                        fit: BoxFit.cover)),
                child: const Center(
                  child: Text(
                    'Login / Signup',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              kheight20,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  maxLength: 10,
                  onChanged: (value) {
                    loginController.phoneNumber.value = value;
                    loginController.update();
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      label: Text("Enter your Mobile Number"),
                      prefix: Text(
                        "+91|",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      )),
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              OnboardingButton(
                buttoncolor: const Color.fromRGBO(168, 191, 243, 0.8),
                title: 'Log in',
                ontap: () {
                  if (loginController.phoneNumber.value.isEmpty ||
                      loginController.phoneNumber.value.length < 10 ||
                      loginController.phoneNumber.value.length > 10) {
                    snackBarShowError(
                        "Error", "Please input correct number", ctx!);
                  } else {
                    loginController.firebaseOtp(
                        "+91 ${loginController.phoneNumber.value}");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
