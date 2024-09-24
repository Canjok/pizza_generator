import 'package:flutter/material.dart';
import 'package:pizza_generator/features/settings/settings.dart';
import 'package:pizza_generator/features/settings/widgets/ingredient_generation_count_item.dart';

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
    BlocProvider.of<SettingsBloc>(context).add(LoadIngredientCountEvent());
    return const Column(
      children: [
        IngredientGenerationCountItem(),
      ],
    );
  }
}
