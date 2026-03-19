import 'package:dalel_app/app/core/app_strings.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:dalel_app/app/modules/home/controllers/home_controller.dart';
import 'package:dalel_app/app/modules/home/views/widgets/custom_header_text.dart';
import 'package:dalel_app/app/modules/home/views/widgets/historical_characters_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CustomHomeBody2 extends GetView<HomeController> {
  const CustomHomeBody2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeaderText(text: AppStrings.historicalCharacters),
          const SizedBox(height: 20),
          Obx(() {
            if (controller.isCharactersLoading.value) {
              return _buildShimmer();
            }

            if (controller.characters.isEmpty) {
              return Center(
                child: Text(
                  'لا توجد شخصيات تاريخية',
                  style: AppTextStyles.poppins500style14,
                ),
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.characters.map((character) {
                  final imagePath = character.photo;

                  return HistoricalCharactersItem(
                    name: character.name,
                    photoUrl: imagePath,
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildShimmer() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          3,
          (_) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
