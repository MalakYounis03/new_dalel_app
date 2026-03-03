import 'package:get/get.dart';

import '../controllers/search_feature_controller.dart';

class SearchFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchFeatureController>(
      () => SearchFeatureController(),
    );
  }
}
