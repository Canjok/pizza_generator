import 'package:flutter/material.dart';
import 'package:pizza_generator/features/settings/bloc/bloc.dart';
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
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return const Column(
          children: [
            IngredientGenerationCountItem(),
          ],
        );
      },
    );
  }
}
