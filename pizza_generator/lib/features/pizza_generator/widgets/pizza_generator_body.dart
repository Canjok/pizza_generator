import 'package:flutter/material.dart';
import 'package:pizza_generator/features/common/widget_constants.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/bloc.dart';
import 'package:pizza_generator/features/pizza_generator/widgets/add_ingredient_item.dart';
import 'package:pizza_generator/features/pizza_generator/widgets/ingredient_list_view.dart';

/// {@template pizza_generator_body}
/// Body of the PizzaGeneratorPage.
///
/// Add what it does
/// {@endtemplate}
class PizzaGeneratorBody extends StatefulWidget {
  /// {@macro pizza_generator_body}
  const PizzaGeneratorBody({super.key});

  @override
  State<PizzaGeneratorBody> createState() => _PizzaGeneratorBodyState();
}

class _PizzaGeneratorBodyState extends State<PizzaGeneratorBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PizzaGeneratorBloc, PizzaGeneratorState>(
      builder: (context, state) {
        return Column(
          children: [
            const IngredientListView(),
            SizedBox(height: WidgetConstants.mediumGap),
            const AddIngredientItem(),
          ],
        );
      },
    );
  }
}
