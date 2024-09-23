import 'package:flutter/material.dart';
import 'package:pizza_generator/features/settings/settings.dart';

class IncreaseButton extends StatelessWidget {
  const IncreaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () => BlocProvider.of<SettingsBloc>(context)
          .add(IncreaseIngredientCountEvent()),
      icon: const Icon(Icons.arrow_right),
    );
  }
}
