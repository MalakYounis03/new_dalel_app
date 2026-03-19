import 'package:dalel_app/app/core/app_assets.dart';
import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:dalel_app/app/modules/home/controllers/home_controller.dart';
import 'package:dalel_app/app/modules/home/model/historical_periods_model.dart';
import 'package:dalel_app/app/modules/home/views/widgets/period_recommendations_section.dart';
import 'package:dalel_app/app/modules/home/views/widgets/recommendation_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class PeriodDetails extends StatelessWidget {
  PeriodDetails({super.key});

  final PeriodModel period = Get.arguments;
  String get displayPeriodName =>
      period.name.replaceAll(RegExp(r'\s+'), ' ').trim();
  final HomeController homeController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController(), permanent: true);

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
                      'About $displayPeriodName',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.poppins400style20,
                    ),
                    const SizedBox(height: 50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ReadMoreText(
                            period.description,
                            trimMode: TrimMode.Line,
                            trimLines: 10,
                            trimCollapsedText: ' ...Read more?',
                            trimExpandedText: ' Show less',
                            style: AppTextStyles.poppins300style16.copyWith(
                              height: 1.5,
                            ),
                            moreStyle: AppTextStyles.poppins400style12.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightGrey,
                            ),
                            lessStyle: AppTextStyles.poppins400style12.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightGrey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            period.photo,
                            width: 132,
                            height: 180,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              width: 132,
                              height: 180,
                              color: AppColors.grey,
                              child: const Icon(Icons.broken_image_outlined),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    if (period.examples.isNotEmpty) ...[
                      Text(
                        '$displayPeriodName Wars',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.poppins400style20,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: period.examples
                            .take(2)
                            .map(
                              (example) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    end: 10,
                                  ),
                                  child: RecommendationItemCard(
                                    title: example.name,
                                    imageUrl: example.photo,
                                    width: double.infinity,
                                    height: 80,
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
            left: 230,
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.85,
                child: Image.asset(Assets.assetsImagesVector1),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 15,
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.85,
                child: Image.asset(Assets.assetsImagesVector2),
              ),
            ),
          ),
          Positioned(
            top: 400,
            right: 6,
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.85,
                child: Image.asset(Assets.assetsImagesVector3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
