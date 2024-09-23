import 'package:flutter/material.dart';
import 'package:pizza_generator/features/settings/settings.dart';

class DecreaseButton extends StatelessWidget {
  const DecreaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () => BlocProvider.of<SettingsBloc>(context)
          .add(DecreaseIngredientCountEvent()),
      icon: const Icon(Icons.arrow_left),
    );
  }
}
