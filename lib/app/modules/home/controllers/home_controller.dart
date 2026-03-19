import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/app/modules/home/model/ancient_wars_model.dart';
import 'package:dalel_app/app/modules/home/model/historical_characters_model.dart';
import 'package:dalel_app/app/modules/home/model/historical_periods_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Historical periods
  final periods = <PeriodModel>[].obs;
  final isLoading = true.obs;

  // Historical characters
  final characters = <CharactersModel>[].obs;
  final isCharactersLoading = true.obs;

  // Ancient wars
  final wars = <AncientWarModel>[].obs;
  final isWarsLoading = true.obs;

  static const String _docId = 'RYTExB8AICz0ykneapAc';

  @override
  void onInit() {
    super.onInit();
    fetchHistoricalData();
    fetchCharacterData();
    fetchWarsData();
  }

  Future<void> fetchHistoricalData() async {
    try {
      isLoading(true);

      final doc = await FirebaseFirestore.instance
          .collection('home')
          .doc(_docId)
          .get();

      final raw = doc.data()?['Historical periods'];
      if (raw is Map<String, dynamic>) {
        final model = HistoricalPeriodsModel.fromMap(raw);
        periods.assignAll(model.periods);
      } else {
        periods.clear();
      }
    } catch (e) {
      periods.clear();
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchCharacterData() async {
    try {
      isCharactersLoading(true);

      final doc = await FirebaseFirestore.instance
          .collection('home')
          .doc(_docId)
          .get();

      final raw = doc.data()?['Historical Characters'];

      if (raw is Map<String, dynamic>) {
        // sort character1, character2, ... by number
        final keys = raw.keys.toList()
          ..sort((a, b) {
            final na = int.tryParse(a.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
            final nb = int.tryParse(b.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
            return na.compareTo(nb);
          });

        final sortedMap = <String, dynamic>{for (final k in keys) k: raw[k]};
        final model = HistoricalCharactersModel.fromMap(sortedMap);
        characters.assignAll(model.characters);
      } else {
        characters.clear();
      }
    } catch (e) {
      characters.clear();
      print(e);
    } finally {
      isCharactersLoading(false);
    }
  }

  Future<void> fetchWarsData() async {
    try {
      isWarsLoading(true);

      final doc = await FirebaseFirestore.instance
          .collection('home')
          .doc(_docId)
          .get();

      final raw = doc.data()?['Ancient Wars'];

      if (raw is Map<String, dynamic>) {
        final model = AncientWarsModel.fromMap(raw);
        wars.assignAll(model.wars);
      } else {
        wars.clear();
      }
    } catch (e) {
      wars.clear();
      print(e);
    } finally {
      isWarsLoading(false);
    }
  }

  Future<void> logout() async {
    try {
      await auth.signOut();
      Get.offAllNamed('/signin');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', 'Failed to logout');
      print(e);
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
      print(e);
    }
  }
}
