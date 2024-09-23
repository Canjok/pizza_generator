import 'package:flutter/material.dart';
import 'package:pizza_generator/features/settings/widgets/ingredient_generation_count_widget.dart';
import 'package:pizza_generator/l10n/l10n.dart';

class IngredientGenerationCountItem extends StatelessWidget {
  const IngredientGenerationCountItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.l10n.numberOfGeneratedIngredients,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const IngredientGenerationCountWidget(),
      ],
    );
  }
}
