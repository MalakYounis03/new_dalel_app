import 'package:dalel_app/app/core/app_strings.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:dalel_app/app/modules/onBoarding/model/on_boarding_model.dart';
import 'package:dalel_app/app/modules/onBoarding/views/widgets/custom_btn.dart';
import 'package:dalel_app/app/modules/onBoarding/views/widgets/on_boarding_widget_body.dart';
import 'package:dalel_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Obx(() {
                return Column(
                  children: [
                    OnBoardingWidgetBody(
                      onPageChanged: (index) {
                        controller.currentPage.value = index;
                        controller.update();
                      },
                    ),
                    SizedBox(height: 50),
                    controller.currentPage.value == onBoardingList.length - 1
                        ? Column(
                            children: [
                              CustomBtn(
                                onPressed: () {
                                  Get.offAllNamed(Routes.SIGNUP);
                                },
                                text: AppStrings.createAccount,
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                child: Text(
                                  AppStrings.loginNow,
                                  style: AppTextStyles.poppins300style16
                                      .copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                                onTap: () {
                                  Get.offAllNamed(Routes.SIGNIN);
                                },
                              ),
                              SizedBox(height: 40),
                            ],
                          )
                        : CustomBtn(
                            onPressed: () => controller.pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                            text: AppStrings.next,
                          ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
