import 'package:dalel_app/app/core/app_assets.dart';
import 'package:dalel_app/app/core/app_strings.dart';
import 'package:dalel_app/app/modules/home/views/widgets/custom_header_text.dart';
import 'package:dalel_app/app/modules/home/views/widgets/historical_characters_item.dart';
import 'package:flutter/material.dart';

class CustomHomeBody2 extends StatelessWidget {
  const CustomHomeBody2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          CustomHeaderText(text: AppStrings.historicalCharacters),
          SizedBox(height: 20),
          Row(
            children: [
              HistoricalCharactersItem(
                text: "Lionheart",
                imagePath: Assets.assetsImagesHistorical1,
              ),
              HistoricalCharactersItem(
                text: "Napoleon",
                imagePath: Assets.assetsImagesHistorical2,
              ),
              HistoricalCharactersItem(
                text: "Saladin",
                imagePath: Assets.assetsImagesHistorical3,
              ),
              HistoricalCharactersItem(
                text: "Qianlong",
                imagePath: Assets.assetsImagesHistorical4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
