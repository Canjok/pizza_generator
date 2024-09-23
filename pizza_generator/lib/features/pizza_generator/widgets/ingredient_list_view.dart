import 'package:flutter/material.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/pizza_generator_bloc.dart';
import 'package:pizza_generator/features/pizza_generator/widgets/selectable_ingredient_widget.dart';
import 'package:pizza_generator/features/settings/bloc/bloc.dart';

class IngredientListView extends StatefulWidget {
  const IngredientListView({super.key});

  @override
  State<IngredientListView> createState() => _IngredientListViewState();
}

class _IngredientListViewState extends State<IngredientListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PizzaGeneratorBloc, PizzaGeneratorState>(
      builder: (context, state) {
        return Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => ingredientBuilder(
                context,
                index,
                state,
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.ingredients.length,
            ),
          ],
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
    return Dismissible(
      background: ColoredBox(
        color: Colors.red.shade400,
        child: const Icon(Icons.delete),
      ),
      direction: DismissDirection.startToEnd,
      key: UniqueKey(),
      onDismissed: (DismissDirection direction) {
        setState(() {
          BlocProvider.of<PizzaGeneratorBloc>(context)
              .add(DeleteIngredientEvent(ingredient: ingredient));
        });
      },
      child: SelectableIngredientWidget(
        isSelected: ingredient.isSelected,
        name: ingredient.name,
      ),
    );
  }
}
