part of 'pizza_generator_bloc.dart';

abstract class PizzaGeneratorEvent extends Equatable {
  const PizzaGeneratorEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_pizza_generator_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class LoadIngredientsEvent extends PizzaGeneratorEvent {
  /// {@macro custom_pizza_generator_event}
  const LoadIngredientsEvent();
}

class IngredientsSelectionChanged extends PizzaGeneratorEvent {
  /// {@macro custom_pizza_generator_event}
  const IngredientsSelectionChanged({
    required this.name,
    required this.isSelected,
  });
  final String name;
  final bool isSelected;
}

class AddIngredientEvent extends PizzaGeneratorEvent {
  const AddIngredientEvent({required this.name});

  final String name;
}
