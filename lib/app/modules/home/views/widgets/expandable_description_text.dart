import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ExpandableDescriptionText extends StatelessWidget {
  const ExpandableDescriptionText({
    super.key,
    required this.text,
    required this.style,
    this.trimLines = 10,
  });

  final String text;
  final TextStyle style;
  final int trimLines;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimMode: TrimMode.Line,
      trimLines: trimLines,
      trimCollapsedText: ' ...Read more?',
      trimExpandedText: ' Show less',
      style: style,
      moreStyle: AppTextStyles.poppins400style12.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.lightGrey,
      ),
      lessStyle: AppTextStyles.poppins400style12.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.lightGrey,
      ),
    );
  }
}
