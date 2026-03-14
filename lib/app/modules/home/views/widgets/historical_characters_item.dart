import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class HistoricalCharactersItem extends StatelessWidget {
  const HistoricalCharactersItem({
    super.key,
    required this.text,
    required this.imagePath,
  });
  final String text;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9),
      height: 133,
      width: 74,
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
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: Image.asset(imagePath),
          ),
          SizedBox(height: 10),
          Text(text, style: AppTextStyles.poppins500style14),
        ],
      ),
    );
  }
}
