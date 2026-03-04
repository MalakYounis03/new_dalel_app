import 'package:dalel_app/app/core/app_assets.dart';
import 'package:dalel_app/app/core/app_strings.dart';

class OnBoardingModel {
  final String title;
  final String description;
  final String image;

  OnBoardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: AppStrings.onBoardingTitle1,
    description: AppStrings.onBoardingDescription1,
    image: Assets.assetsImagesOnBoarding1,
  ),
  OnBoardingModel(
    title: AppStrings.onBoardingTitle2,
    description: AppStrings.onBoardingDescription2,
    image: Assets.assetsImagesOnBoarding2,
  ),
  OnBoardingModel(
    title: AppStrings.onBoardingTitle3,
    description: AppStrings.onBoardingDescription3,
    image: Assets.assetsImagesOnBoarding3,
  ),
];
