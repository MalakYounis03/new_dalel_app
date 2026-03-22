import 'package:dalel_app/app/core/app_assets.dart';
import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:dalel_app/app/modules/home/controllers/home_controller.dart';
import 'package:dalel_app/app/modules/home/model/historical_characters_model.dart';
import 'package:dalel_app/app/modules/home/views/widgets/expandable_description_text.dart';
import 'package:dalel_app/app/modules/home/views/widgets/period_recommendations_section.dart';
import 'package:dalel_app/app/modules/home/views/widgets/recommendation_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CharacterDetails extends StatelessWidget {
  CharacterDetails({super.key});

  final CharactersModel character = Get.arguments;
  final HomeController homeController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController(), permanent: true);

  String get displayCharacterName =>
      character.name.replaceAll(RegExp(r'\s+'), ' ').trim();

  Widget _buildImageShimmer({
    required double width,
    required double height,
    BorderRadius? borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }

  Widget _buildCharacterImageSection() {
    return SizedBox(
      width: 150,
      height: 210,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Positioned(
          //   top: 10,
          //   child: Image.asset(
          //     Assets.assetsImagesSaladinBackground,
          //     width: 126,
          //     fit: BoxFit.contain,
          //   ),
          // ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.network(
                character.insidePhoto,
                fit: BoxFit.fitHeight,
                width: 200,
                height: 300,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return _buildImageShimmer(width: 200, height: 300);
                },
                errorBuilder: (_, _, _) => Container(
                  width: 132,
                  height: 180,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.broken_image_outlined),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDecorativeCircle({
    required String asset,
    required double top,
    double? left,
    double? right,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: IgnorePointer(child: Image.asset(asset)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/Frame.png'),
                        const Spacer(),
                        Text(
                          'Dalel',
                          style: AppTextStyles.pacifico400style64.copyWith(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'About $displayCharacterName',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.poppins400style20,
                    ),
                    const SizedBox(height: 50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ExpandableDescriptionText(
                            text: character.description,
                            style: AppTextStyles.poppins500style14.copyWith(
                              height: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        _buildCharacterImageSection(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    if (character.wars.isNotEmpty) ...[
                      Text(
                        '$displayCharacterName Wars',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.poppins400style20,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: character.wars
                            .take(2)
                            .map(
                              (war) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    end: 10,
                                  ),
                                  child: RecommendationItemCard(
                                    title: war.name,
                                    imageUrl: war.photo,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                    ],
                    Obx(
                      () => PeriodRecommendationsSection(
                        characters: homeController.characters.toList(),
                        isLoading: homeController.isCharactersLoading.value,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 300,
            child: Image.asset(
              Assets.assetsImagesSaladinBackground2,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          _buildDecorativeCircle(asset: Assets.assetsImagesEllipse4, top: 130),
          _buildDecorativeCircle(
            asset: Assets.assetsImagesEllipse5,
            top: 130,
            left: 40,
          ),

          _buildDecorativeCircle(
            asset: Assets.assetsImagesEllipse6,
            top: 400,
            left: 310,
          ),
          _buildDecorativeCircle(
            asset: Assets.assetsImagesEllipse7,
            top: 400,
            left: 290,
          ),
        ],
      ),
    );
  }
}
