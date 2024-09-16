import 'package:flutter/material.dart';
import 'package:pizza_generator/features/common/widget_constants.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/bloc.dart';
import 'package:pizza_generator/features/pizza_generator/widgets/pizza_generator_body.dart';
import 'package:pizza_generator/features/settings/view/settings_page.dart';
import 'package:pizza_generator/injection_container.dart';
import 'package:pizza_generator/l10n/l10n.dart';

/// {@template pizza_generator_page}
/// A description for PizzaGeneratorPage
/// {@endtemplate}
class PizzaGeneratorPage extends StatelessWidget {
  /// {@macro pizza_generator_page}
  const PizzaGeneratorPage({super.key});

  /// The static route for PizzaGeneratorPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const PizzaGeneratorPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PizzaGeneratorBloc(
        addIngredientUsecase: sl(),
        deleteIngredientUsecase: sl(),
        loadIngredientsUsecase: sl(),
        saveIngredientsUsecase: sl(),
      )..add(const LoadIngredientsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.appTitle),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<dynamic>(
                  builder: (context) => const SettingsPage(),
                ),
              ),
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(WidgetConstants.pagePadding),
          child: const PizzaGeneratorView(),
        ),
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
