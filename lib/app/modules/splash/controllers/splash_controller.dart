import 'package:dalel_app/app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/app/core/service/service_locator.dart';
import 'package:dalel_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    bool isOnBoardingVisited =
        getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
    if (isOnBoardingVisited == true) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed(Routes.SIGNIN);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed(Routes.ON_BOARDING);
      });
    }
  }
}
