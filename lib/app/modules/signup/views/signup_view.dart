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
      body: Form(
        key: controller.formKey,
        child: Column(
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
                    CustomTextFormFiled(
                      label: AppStrings.fristName,
                      controller: controller.firstName,
                      validator: (value) {
                        if (value!.isEmpty) return "first name is required";
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    CustomTextFormFiled(
                      label: AppStrings.lastName,
                      controller: controller.lastName,
                      validator: (value) {
                        if (value!.isEmpty) return "last name is required";
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
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

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: controller.isChecked.value,
                              onChanged: (value) =>
                                  controller.isChecked.value = value!,
                              activeColor: AppColors.primaryColor,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "I have agree to our ",
                                  style: AppTextStyles.poppins400style12
                                      .copyWith(color: AppColors.darkGrey),
                                ),
                                TextSpan(
                                  text: "Terms and Condition",
                                  style: AppTextStyles.poppins400style12
                                      .copyWith(
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

                    SizedBox(height: 70),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return CircularProgressIndicator();
                      } else {
                        return CustomBtn(
                          backgroundColor: controller.isChecked.value
                              ? AppColors.primaryColor
                              : AppColors.lightGrey,
                          onPressed: () {
                            controller.isChecked.value == false
                                ? null
                                : controller.register(
                                    email: controller.email.text,
                                    password: controller.password.text,
                                    firstName: controller.firstName.text,
                                    lastName: controller.lastName.text,
                                  );
                          },
                          text: AppStrings.signUp,
                        );
                      }
                    }),
                    SizedBox(height: 16),
                    AuthToggleText(
                      questionText: AppStrings.alreadyHaveAnAccount,
                      actionText: AppStrings.signIn,
                      onTap: () {
                        Get.offNamed(Routes.SIGNIN);
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
