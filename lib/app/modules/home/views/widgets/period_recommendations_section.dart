import 'package:dalel_app/app/core/app_strings.dart';
import 'package:dalel_app/app/core/app_text_styles.dart';
import 'package:dalel_app/app/modules/home/model/historical_characters_model.dart';
import 'package:dalel_app/app/modules/home/views/widgets/historical_characters_item.dart';
import 'package:flutter/material.dart';

class PeriodRecommendationsSection extends StatelessWidget {
  const PeriodRecommendationsSection({
    super.key,
    required this.characters,
    this.isLoading = false,
    this.title = AppStrings.recommendations,
  });

  final String title;
  final List<CharactersModel> characters;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: 160,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    if (characters.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.poppins400style20),
        const SizedBox(height: 10),
        SizedBox(
          height: 133,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return HistoricalCharactersItem(
                name: character.name,
                photoUrl: character.photo,
              );
            },
          ),
        ),
      ],
    );
  }
}
