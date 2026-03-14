import 'package:dalel_app/app/core/app_assets.dart';
import 'package:dalel_app/app/modules/home/views/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';

class CustomHomeBody3 extends StatelessWidget {
  const CustomHomeBody3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          CustomHeaderText(text: "Ancient Wars"),
          SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.asset(images[index], fit: BoxFit.cover);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final PageController pageController = PageController();

final List<String> images = [
  Assets.assetsImagesWars1,
  Assets.assetsImagesWars2,
  Assets.assetsImagesWars3,
];
