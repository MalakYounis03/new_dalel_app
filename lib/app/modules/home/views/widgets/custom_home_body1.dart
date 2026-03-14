import 'package:dalel_app/app/core/app_assets.dart';
import 'package:dalel_app/app/core/app_strings.dart';
import 'package:dalel_app/app/modules/home/views/widgets/custom_header_text.dart';
import 'package:dalel_app/app/modules/home/views/widgets/historical_periods_item.dart';
import 'package:flutter/material.dart';

class CustomHomeBody1 extends StatelessWidget {
  const CustomHomeBody1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          CustomHeaderText(text: AppStrings.historicalPeriods),
          SizedBox(height: 20),
          Row(
            children: [
              HistoricalPeriodsItem(
                text: "Ancient\nEgypt",
                imagePath: Assets.assetsImagesAncient,
              ),
              SizedBox(width: 20),
              HistoricalPeriodsItem(
                text: "Islamic\nEra ",
                imagePath: Assets.assetsImagesIslamic,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
