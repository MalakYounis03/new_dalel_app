import 'package:dalel_app/app/core/app_assets.dart';
import 'package:dalel_app/app/core/app_strings.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:dalel_app/app/core/widgets/custom_btn.dart';
import 'package:dalel_app/app/core/widgets/text_form_filed.dart';
import 'package:dalel_app/app/modules/signin/controllers/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends GetView<SigninController> {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.forgetPassFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Forgot Password", style: AppTextStyles.poppins600style28),
              SizedBox(height: 30),
              Image.asset(Assets.assetsImagesForgetPassword),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Enter your registered email below to receive\n                password reset instruction",
                  style: AppTextStyles.poppins400style12,
                ),
              ),
              SizedBox(height: 20),
              CustomTextFormFiled(
                label: AppStrings.emailAddress,
                controller: controller.forgetPasswordEmail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 150),
              CustomBtn(
                onPressed: () {
                  controller.resetPassword(
                    email: controller.forgetPasswordEmail.text,
                  );
                },
                text: "Send Verification Code",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
