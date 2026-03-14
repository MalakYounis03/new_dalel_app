import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomHomeViewAppBar extends StatelessWidget {
  const CustomHomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 40),
          Row(
            children: [
              Image.asset("assets/images/Frame.png"),
              Spacer(),
              Text(
                "Dalel",
                style: AppTextStyles.pacifico400style64.copyWith(fontSize: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
