import 'package:dalel_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController forgetPasswordEmail = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  final signinFormKey = GlobalKey<FormState>();
  final forgetPassFormKey = GlobalKey<FormState>();

  Future<void> signin({required String email, required String password}) async {
    if (!signinFormKey.currentState!.validate()) {
      return;
    }
    try {
      isLoading.value = true;

      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar("FirebaseAuthException", "$e");
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "An error occurred");
    }
  }

  Future<void> resetPassword({required String email}) async {
    if (!forgetPassFormKey.currentState!.validate()) return; // ✅

    try {
      isLoading.value = true;
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Success", "Password reset email sent");
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar("FirebaseAuthException", "$e");
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "An error occurred");
    }
  }
}
