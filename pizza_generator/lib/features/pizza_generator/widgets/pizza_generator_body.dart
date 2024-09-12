import 'package:flutter/material.dart';
import 'package:pizza_generator/features/common/widget_constants.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/bloc.dart';
import 'package:pizza_generator/features/pizza_generator/widgets/add_ingredient_item.dart';
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
            SizedBox(height: WidgetConstants.mediumGap),
            const AddIngredientItem(),
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
