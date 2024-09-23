import 'package:flutter/material.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/bloc.dart';
import 'package:pizza_generator/l10n/l10n.dart';

class IngredientGeneratorButton extends StatelessWidget {
  const IngredientGeneratorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => BlocProvider.of<PizzaGeneratorBloc>(context)
          .add(const GenerateIngredientsEvent()),
      child: Text(context.l10n.create),
    );
  }
}
