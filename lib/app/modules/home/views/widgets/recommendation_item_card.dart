import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class RecommendationItemCard extends StatelessWidget {
  const RecommendationItemCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.width = 154,
    this.height = 90,
  });

  final String title;
  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.poppins500style14.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imageUrl,
              width: 46,
              height: 46,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 46,
                height: 46,
                color: AppColors.grey,
                child: const Icon(Icons.broken_image_outlined, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
