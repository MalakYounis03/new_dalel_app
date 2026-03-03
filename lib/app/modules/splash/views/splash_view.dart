import 'package:dalel_app/app/core/app_strings.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: AppTextStyles.pacifico400style64,
        ),
      ),
    );
  }
}
