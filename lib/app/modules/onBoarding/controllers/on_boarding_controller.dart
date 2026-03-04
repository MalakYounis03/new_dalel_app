import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  final pageController = PageController(initialPage: 0);
  RxInt currentPage = 0.obs;

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
