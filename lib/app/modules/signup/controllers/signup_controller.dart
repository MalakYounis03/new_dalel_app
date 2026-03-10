import 'package:dalel_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      isLoading.value = true;

      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Account created successfully");
      Get.offNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar("FirebaseAuthException", "$e");
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "$e");
    }
  }

  final isChecked = false.obs;
}
