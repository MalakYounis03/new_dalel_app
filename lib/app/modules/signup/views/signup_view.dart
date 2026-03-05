import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/core/app_strings.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:dalel_app/app/core/widgets/auth_toggle_text.dart';
import 'package:dalel_app/app/core/widgets/text_form_filed.dart';
import 'package:dalel_app/app/core/widgets/custom_btn.dart';
import 'package:dalel_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 152),
                  Text(
                    AppStrings.welcome,
                    style: AppTextStyles.poppins600style28.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 60),
                  CustomTextFormFiled(label: AppStrings.fristName),
                  SizedBox(height: 16),
                  CustomTextFormFiled(label: AppStrings.lastName),
                  SizedBox(height: 16),
                  CustomTextFormFiled(label: AppStrings.emailAddress),
                  SizedBox(height: 16),
                  CustomTextFormFiled(label: AppStrings.password),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "I have agree to our ",
                                style: AppTextStyles.poppins400style12.copyWith(
                                  color: AppColors.darkGrey,
                                ),
                              ),
                              TextSpan(
                                text: "Terms and Condition",
                                style: AppTextStyles.poppins400style12.copyWith(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomBtn(onPressed: () {}, text: AppStrings.signUp),
          SizedBox(height: 16),
          AuthToggleText(
            questionText: AppStrings.alreadyHaveAnAccount,
            actionText: AppStrings.signIn,
            onTap: () {
              Get.offNamed(Routes.SIGNIN);
            },
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
