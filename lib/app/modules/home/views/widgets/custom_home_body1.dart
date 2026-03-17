import 'package:dalel_app/app/core/app_strings.dart';
import 'package:dalel_app/app/modules/home/controllers/home_controller.dart';
import 'package:dalel_app/app/modules/home/views/widgets/custom_header_text.dart';
import 'package:dalel_app/app/modules/home/views/widgets/historical_periods_item.dart';
import 'package:dalel_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHomeBody1 extends GetView<HomeController> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HistoricalPeriodsItem(
                text: controller.periods[0].name,
                imagePath: controller.periods[0].photo,
                onTap: () {
                  Get.toNamed(
                    Routes.PeriodDetails,
                    arguments: controller.periods[0],
                  );
                },
              ),
              SizedBox(width: 20),
              HistoricalPeriodsItem(
                text: controller.periods[1].name,
                imagePath: controller.periods[1].photo,
                onTap: () {
                  Get.toNamed(
                    Routes.PeriodDetails,
                    arguments: controller.periods[1],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
