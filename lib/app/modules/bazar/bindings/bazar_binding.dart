import 'package:get/get.dart';

import '../controllers/bazar_controller.dart';

class BazarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BazarController>(
      () => BazarController(),
    );
  }
}
