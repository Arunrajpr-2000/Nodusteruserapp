import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:noduster/common/snackbar.dart';
import 'package:noduster/controller/dependency/dependency.dart';
import 'package:noduster/screens/login_screen/otp_screen.dart';

class LoginController extends GetxController {
  RxString phoneNumber = "".obs;
  RxString otpNumber = "".obs;
  RxString verificationNumId = "".obs;
  final fireAuth = FirebaseAuth.instance;
  var ctx = Get.context;
  Future firebaseOtp(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber.toString().trim(),
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          snackBarShowError("error", e.toString(), ctx!);
        },
        codeSent: (String verificationId, int? resendToken) async {
          verificationNumId.value = verificationId;
          Get.to(() => OTPScreen());
          snackBarShowSuccess("PROMPT", "OTP SENT SUCCESSFULLY", ctx!);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      snackBarShowError("Error", e.toString(), ctx!);
    }
  }

  @override
  void dispose() {
    loginController.dispose();

    super.dispose();
  }
}
