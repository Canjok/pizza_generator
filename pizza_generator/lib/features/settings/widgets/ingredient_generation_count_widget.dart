import 'package:flutter/material.dart';
import 'package:pizza_generator/features/common/widget_constants.dart';
import 'package:pizza_generator/features/settings/settings.dart';
import 'package:pizza_generator/features/settings/widgets/decrease_button.dart';
import 'package:pizza_generator/features/settings/widgets/increase_button.dart';

class IngredientGenerationCountWidget extends StatelessWidget {
  const IngredientGenerationCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DecreaseButton(),
        SizedBox(width: WidgetConstants.mediumGap),
        BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) => Text(
            state.ingredientCountToGenerate.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        SizedBox(width: WidgetConstants.mediumGap),
        const IncreaseButton(),
      ],
    );
  }
}
