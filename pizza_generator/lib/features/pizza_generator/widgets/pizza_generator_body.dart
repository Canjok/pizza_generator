import 'package:flutter/material.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/bloc.dart';

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
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
