import 'package:cloud_firestore/cloud_firestore.dart';
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
  final CollectionReference users = FirebaseFirestore.instance.collection(
    'users',
  );
  final isChecked = false.obs;

  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    if (!formKey.currentState!.validate()) return;
    if (!isChecked.value) {
      Get.snackbar("Error", "يجب الموافقة على الشروط");
      return;
    }
    try {
      isLoading.value = true;

      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await addUserProfile(
        email: email,
        firstName: firstName,
        lastName: lastName,
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

  Future<void> addUserProfile({
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    String uid = auth.currentUser!.uid;
    await users.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    });
  }
}
