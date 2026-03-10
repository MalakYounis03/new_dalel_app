import 'package:dalel_app/app/core/app_assets.dart';
import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/core/app_strings.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:dalel_app/app/core/widgets/auth_toggle_text.dart';
import 'package:dalel_app/app/core/widgets/text_form_filed.dart';
import 'package:dalel_app/app/core/widgets/custom_btn.dart';
import 'package:dalel_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.signinFormKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: AppColors.primaryColor,

                          width: double.infinity,
                          height: 300,
                        ),
                        Positioned(
                          top: 120,
                          left: 150,
                          child: Text(
                            "Dalel",
                            style: AppTextStyles.saira700style32,
                          ),
                        ),
                        Positioned(
                          top: 188,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(Assets.assetsImagesAhramat),
                              Image.asset(Assets.assetsImagesMasgid),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      AppStrings.welcomeBack,
                      style: AppTextStyles.poppins500style24,
                    ),
                    SizedBox(height: 40),
                    CustomTextFormFiled(
                      label: AppStrings.emailAddress,
                      controller: controller.email,
                      validator: (value) {
                        if (value!.isEmpty) return "email is required";
                        if (!GetUtils.isEmail(value)) {
                          return "invalid email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    CustomTextFormFiled(
                      label: AppStrings.password,
                      controller: controller.password,
                      isPassword: true,
                      validator: (value) {
                        if (value!.isEmpty) return "password is required";
                        if (value.length < 6) {
                          return "password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.FORGET_PASSWORD),
                          child: Text(
                            AppStrings.forgotPassword,
                            style: AppTextStyles.poppins400style12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100),

                    Obx(() {
                      if (controller.isLoading.value) {
                        return CircularProgressIndicator();
                      } else {
                        return CustomBtn(
                          onPressed: () {
                            controller.signin(
                              email: controller.email.text,
                              password: controller.password.text,
                            );
                          },
                          text: AppStrings.signIn,
                        );
                      }
                    }),
                    SizedBox(height: 16),
                    AuthToggleText(
                      questionText: AppStrings.dontHaveAnAccount,
                      actionText: AppStrings.signUp,
                      onTap: () {
                        Get.offNamed(Routes.SIGNUP);
                      },
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
