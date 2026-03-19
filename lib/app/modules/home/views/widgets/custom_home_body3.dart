import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:dalel_app/app/modules/home/controllers/home_controller.dart';
import 'package:dalel_app/app/modules/home/views/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CustomHomeBody3 extends GetView<HomeController> {
  const CustomHomeBody3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeaderText(text: 'Ancient Wars'),
          const SizedBox(height: 20),
          Obx(() {
            if (controller.isWarsLoading.value) {
              return _buildShimmer();
            }

            if (controller.wars.isEmpty) {
              return SizedBox(
                height: 180,
                child: Center(
                  child: Text(
                    'No wars found',
                    style: AppTextStyles.poppins500style14,
                  ),
                ),
              );
            }

            return SizedBox(
              height: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: PageView.builder(
                  itemCount: controller.wars.length,
                  itemBuilder: (context, index) {
                    final war = controller.wars[index];
                    return Image.network(
                      war.photo,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return _buildShimmer();
                      },
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey.shade200,
                        alignment: Alignment.center,
                        child: const Icon(Icons.broken_image_outlined),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildShimmer() {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
