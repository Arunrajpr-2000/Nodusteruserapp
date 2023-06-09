import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:noduster/common/snackbar.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/controller/logincontroller.dart';
import 'package:noduster/screens/home_screen/home_screen.dart';
import 'package:noduster/screens/onboarding_screen/widgets/onboarding_button.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({
    super.key,
  });

  final LoginController loginController = Get.put(LoginController());
  final ctx = Get.context;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 24,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(168, 191, 243, 0.8),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
          kheight20,
          Container(
            height: 300,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/asset/onboard1background.png'),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset('lib/asset/phone.png'),
                ),
                kheight10,
                const Text(
                  'Enter verification code',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            )),
          ),
          kheight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                    'We have sent an OTP to\n ${loginController.phoneNumber.value}',
                    style: GoogleFonts.lexend(
                        fontSize: 18, color: const Color(0xff80868b))),
              ),
            ],
          ),
          kheight20,
          Padding(
            padding: const EdgeInsets.all(15),
            child: Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              length: 6,
              submittedPinTheme: submittedPinTheme,
              onCompleted: (pin) {
                loginController.otpNumber.value = pin;
              },
              showCursor: true,
            ),
          ),
          const SizedBox(height: 10),
          OnboardingButton(
            buttoncolor: const Color.fromRGBO(168, 191, 243, 0.8),
            title: 'Log in',
            ontap: () async {
              if (loginController.otpNumber.value.isNotEmpty) {
                if (loginController.verificationNumId.value ==
                    loginController.otpNumber.value) {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: loginController.verificationNumId.value,
                      smsCode: loginController.otpNumber.value);

                  await auth.signInWithCredential(credential);

                  snackBarShowSuccess(
                    "Success",
                    "Verified Successfully",
                    ctx!,
                  );
                  Get.offAll(() => const HomeScreen());
                } else {
                  snackBarShowError("Error", "Wrong OTP", ctx!);
                  return;
                }
              }
            },
          ),
        ])),
      ),
    );
  }
}
