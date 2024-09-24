import 'package:flutter/material.dart';
import 'package:pizza_generator/features/settings/widgets/multiple_ingredient_usage_switch.dart';
import 'package:pizza_generator/l10n/l10n.dart';

class MultipleIngredientUsageItem extends StatelessWidget {
  const MultipleIngredientUsageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.l10n.allowMultipleUsageOfAnIngredient,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const MultipleIngredientUsageSwitch(),
      ],
    );
  }
}
