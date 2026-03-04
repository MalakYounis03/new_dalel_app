import 'package:dalel_app/app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndecator extends StatelessWidget {
  const CustomSmoothPageIndecator({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      effect: ExpandingDotsEffect(
        dotHeight: 7,
        dotWidth: 10,
        activeDotColor: AppColors.deepBrown,
        dotColor: AppColors.primaryColor,
      ),
    );
  }
}
