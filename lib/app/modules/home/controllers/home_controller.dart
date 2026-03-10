import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> logout() async {
    try {
      await auth.signOut();
      print("Success Logout");
      Get.offAllNamed("/signin");
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", "Failed to logout");
      print("FirebaseAuthException : $e");
    } catch (e) {
      Get.snackbar("Error", "An error occurred");
      print("Exception : $e");
    }
  }
}
