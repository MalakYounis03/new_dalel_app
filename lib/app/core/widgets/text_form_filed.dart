import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 64,
      child: TextFormField(
        cursorColor: AppColors.borderColor,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: AppTextStyles.poppins400style12.copyWith(
            color: AppColors.borderColor,
            fontSize: 14,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: AppColors.lightGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: AppColors.lightGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: AppColors.lightGrey),
          ),
        ),
      ),
    );
  }
}
