import 'package:flutter/material.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/bloc.dart';
import 'package:pizza_generator/features/pizza_generator/widgets/selectable_ingredient_widget.dart';

/// {@template pizza_generator_body}
/// Body of the PizzaGeneratorPage.
///
/// Add what it does
/// {@endtemplate}
class PizzaGeneratorBody extends StatelessWidget {
  /// {@macro pizza_generator_body}
  const PizzaGeneratorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PizzaGeneratorBloc, PizzaGeneratorState>(
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) => ingredientBuilder(
            context,
            index,
            state,
          ),
          separatorBuilder: (context, index) => const Divider(
            height: 8,
          ),
          itemCount: state.ingredients.length,
        );
      },
    );
  }

  Widget ingredientBuilder(
    BuildContext context,
    int index,
    PizzaGeneratorState state,
  ) {
    final ingredient = state.ingredients[index];
    return SelectableIngredientWidget(
      isSelected: ingredient.isSelected,
      name: ingredient.name,
    );
  }
}
