import 'package:flutter/material.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/bloc.dart';

class GeneratedIngredientsView extends StatelessWidget {
  const GeneratedIngredientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PizzaGeneratorBloc, PizzaGeneratorState>(
      builder: (context, state) => ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            _generatedListBuilder(state.generatedIngredients, index),
        itemCount: state.generatedIngredients.length,
      ),
    );
  }

  Widget _generatedListBuilder(List<String> ingredients, int index) {
    final ingredient = ingredients[index];
    return Text(ingredient);
  }
}
