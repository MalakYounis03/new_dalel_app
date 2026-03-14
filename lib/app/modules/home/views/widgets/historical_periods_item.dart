import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsItem extends StatelessWidget {
  const HistoricalPeriodsItem({
    super.key,
    required this.text,
    required this.imagePath,
  });
  final String text;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 2.5),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      width: 164,
      height: 94,
      child: Row(
        children: [
          Text(text, style: AppTextStyles.poppins500style14),
          Spacer(),
          Image.asset(imagePath),
        ],
      ),
    );
  }
}
