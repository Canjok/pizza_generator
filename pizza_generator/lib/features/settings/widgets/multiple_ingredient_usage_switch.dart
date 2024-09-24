import 'package:flutter/material.dart';
import 'package:pizza_generator/features/pizza_generator/pizza_generator.dart';
import 'package:pizza_generator/features/settings/bloc/settings_bloc.dart';

class MultipleIngredientUsageSwitch extends StatefulWidget {
  const MultipleIngredientUsageSwitch({super.key});

  @override
  State<MultipleIngredientUsageSwitch> createState() =>
      _MultipleIngredientUsageSwitchState();
}

class _MultipleIngredientUsageSwitchState
    extends State<MultipleIngredientUsageSwitch> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    final settingsState = BlocProvider.of<SettingsBloc>(context).state;
    isSelected = settingsState.allowMultipleUsageOfAnIngredient;
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: isSelected,
      onChanged: (value) => setState(
        () {
          BlocProvider.of<SettingsBloc>(context).add(
            SetAllowMultipleUsageOfAnIngredientEvent(allow: value),
          );
          isSelected = value;
        },
      ),
    );
  }
}
