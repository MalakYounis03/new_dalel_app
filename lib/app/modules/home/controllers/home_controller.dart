import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/app/modules/home/model/home_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  var periods = <PeriodModel>[];

  @override
  void onInit() {
    fetchHistoricalData();
    super.onInit();
  }

  void fetchHistoricalData() async {
    try {
      var doc = await FirebaseFirestore.instance
          .collection('home')
          .doc('RYTExB8AICz0ykneapAc')
          .get();

      var historical = HistoricalPeriodsModel.fromMap(
        doc['Historical periods'],
      );

      periods = historical.periods;
    } catch (e) {
      print(e);
    }
  }

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
