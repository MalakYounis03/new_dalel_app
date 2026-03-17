import 'package:dalel_app/app/modules/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeriodDetails extends StatelessWidget {
  PeriodDetails({super.key});
  final PeriodModel period = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(period.name),
          Text(period.description),
          Image.network(period.photo),
          ...period.examples.map(
            (example) => Column(
              children: [Text(example.name), Image.network(example.photo)],
            ),
          ),
        ],
      ),
    );
  }
}
