import 'package:flutter/material.dart';
import 'package:pizza_generator/features/pizza_generator/pizza_generator.dart';
import 'package:pizza_generator/features/settings/bloc/settings_bloc.dart';

class MultipleIngredientUsageSwitch extends StatelessWidget {
  const MultipleIngredientUsageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) => Switch.adaptive(
        value: state.allowMultipleUsageOfAnIngredient,
        onChanged: (value) => BlocProvider.of<SettingsBloc>(context).add(
          SetAllowMultipleUsageOfAnIngredientEvent(allow: value),
        ),
      ),
    );
  }
}
