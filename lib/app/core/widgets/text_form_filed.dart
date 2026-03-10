import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatefulWidget {
  const CustomTextFormFiled({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    required this.validator,
  });
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 64,
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.isPassword ? obscureText : false,
        cursorColor: AppColors.borderColor,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () => setState(() => obscureText = !obscureText),
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: obscureText
                        ? AppColors.lightGrey
                        : AppColors.borderColor,
                  ),
                )
              : null,

          labelText: widget.label,
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
