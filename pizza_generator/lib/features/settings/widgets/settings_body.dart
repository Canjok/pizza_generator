import 'package:flutter/material.dart';
import 'package:pizza_generator/features/common/widget_constants.dart';
import 'package:pizza_generator/features/settings/widgets/ingredient_generation_count_item.dart';
import 'package:pizza_generator/features/settings/widgets/multiple_ingredient_usage_item.dart';

/// {@template settings_body}
/// Body of the SettingsPage.
///
/// Add what it does
/// {@endtemplate}
class SettingsBody extends StatelessWidget {
  /// {@macro settings_body}
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const IngredientGenerationCountItem(),
        SizedBox(
          height: WidgetConstants.mediumGap,
        ),
        const MultipleIngredientUsageItem(),
      ],
    );
  }
}
