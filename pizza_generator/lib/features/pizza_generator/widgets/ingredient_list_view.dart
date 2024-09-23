import 'package:flutter/material.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/pizza_generator_bloc.dart';
import 'package:pizza_generator/features/pizza_generator/widgets/selectable_ingredient_widget.dart';
import 'package:pizza_generator/features/settings/bloc/bloc.dart';

class IngredientListView extends StatelessWidget {
  const IngredientListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PizzaGeneratorBloc, PizzaGeneratorState>(
      buildWhen: (previous, current) {
        return true;
      },
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => _ingredientBuilder(
            context,
            index,
            state,
          ),
          itemCount: state.ingredients.length,
        );
      },
    );
  }

  Widget _ingredientBuilder(
    BuildContext context,
    int index,
    PizzaGeneratorState state,
  ) {
    final ingredient = state.ingredients[index];
    return Dismissible(
      background: ColoredBox(
        color: Colors.red.shade400,
        child: const Icon(Icons.delete),
      ),
      direction: DismissDirection.startToEnd,
      key: UniqueKey(),
      onDismissed: (DismissDirection direction) {
        BlocProvider.of<PizzaGeneratorBloc>(context)
            .add(DeleteIngredientEvent(ingredient: ingredient));
      },
      child: SelectableIngredientWidget(
        isSelected: ingredient.isSelected,
        name: ingredient.name,
      ),
    );
  }
}
