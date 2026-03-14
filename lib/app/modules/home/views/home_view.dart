import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/modules/home/views/widgets/custom_home_body1.dart';
import 'package:dalel_app/app/modules/home/views/widgets/custom_home_body2.dart';
import 'package:dalel_app/app/modules/home/views/widgets/custom_home_body3.dart';
import 'package:dalel_app/app/modules/home/views/widgets/custom_home_view_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomHomeViewAppBar()),
          SliverToBoxAdapter(child: CustomHomeBody1()),
          SliverToBoxAdapter(child: CustomHomeBody2()),
          SliverToBoxAdapter(child: CustomHomeBody3()),
        ],
      ),
    );
  }
}
