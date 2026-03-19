import 'package:dalel_app/app/core/app_colors.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class HistoricalCharactersItem extends StatelessWidget {
  const HistoricalCharactersItem({
    super.key,
    required this.name,
    required this.photoUrl,
  });
  final String photoUrl;
  final String name;

  String get _firstName {
    final trimmed = name.trim();
    if (trimmed.isEmpty) {
      return '';
    }
    return trimmed.split(RegExp(r'\s+')).first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9),
      height: 133,
      width: 74,
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 2.5),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: Image.network(
              photoUrl,
              height: 100, // ← fixed height so text has room below
              width: 74,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Image.asset(
                'assets/images/default_photo.png',
                height: 100,
                width: 74,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              _firstName,
              style: AppTextStyles.poppins500style14,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
