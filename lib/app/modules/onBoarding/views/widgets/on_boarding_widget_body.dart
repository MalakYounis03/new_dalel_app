import 'package:dalel_app/app/core/app_strings.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:dalel_app/app/modules/onBoarding/controllers/on_boarding_controller.dart';
import 'package:dalel_app/app/modules/onBoarding/model/on_boarding_model.dart';
import 'package:dalel_app/app/modules/onBoarding/views/widgets/custom_smooth_page_indecator.dart';
import 'package:dalel_app/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingWidgetBody extends GetView<OnBoardingController> {
  const OnBoardingWidgetBody({super.key, required this.onPageChanged});

  final void Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: onBoardingList.length,
        controller: controller.pageController,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 40),

              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.offAllNamed(Routes.SIGNUP);
                  },
                  child: Text(
                    AppStrings.skip,
                    style: AppTextStyles.poppins400style12.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 343,
                height: 290,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(onBoardingList[index].image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomSmoothPageIndecator(
                pageController: controller.pageController,
              ),
              SizedBox(height: 40),
              Text(
                onBoardingList[index].title,
                style: AppTextStyles.poppins500style24,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20),
              Text(
                onBoardingList[index].description,
                style: AppTextStyles.poppins300style16,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}
