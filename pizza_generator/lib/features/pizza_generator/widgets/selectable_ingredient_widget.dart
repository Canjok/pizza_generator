import 'package:flutter/material.dart';
import 'package:pizza_generator/features/pizza_generator/pizza_generator.dart';

class SelectableIngredientWidget extends StatefulWidget {
  const SelectableIngredientWidget({
    required this.isSelected,
    required this.name,
    super.key,
  });

  final bool isSelected;
  final String name;

  @override
  State<SelectableIngredientWidget> createState() =>
      _SelectableIngredientWidgetState();
}

class _SelectableIngredientWidgetState
    extends State<SelectableIngredientWidget> {
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Switch.adaptive(
          value: isSelected,
          onChanged: (value) => setState(
            () {
              BlocProvider.of<PizzaGeneratorBloc>(context).add(
                IngredientsSelectionChanged(
                  name: widget.name,
                  isSelected: value,
                ),
              );
              isSelected = value;
            },
          ),
        ),
      ],
    );
  }
}
