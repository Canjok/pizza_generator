import 'package:flutter/material.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/bloc.dart';
import 'package:pizza_generator/features/pizza_generator/widgets/pizza_generator_body.dart';

/// {@template pizza_generator_page}
/// A description for PizzaGeneratorPage
/// {@endtemplate}
class PizzaGeneratorPage extends StatelessWidget {
  /// {@macro pizza_generator_page}
  const PizzaGeneratorPage({super.key});

  /// The static route for PizzaGeneratorPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PizzaGeneratorPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PizzaGeneratorBloc(),
      child: const Scaffold(
        body: PizzaGeneratorView(),
      ),
    );
  }    
}

/// {@template pizza_generator_view}
/// Displays the Body of PizzaGeneratorView
/// {@endtemplate}
class PizzaGeneratorView extends StatelessWidget {
  /// {@macro pizza_generator_view}
  const PizzaGeneratorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PizzaGeneratorBody();
  }
}
