part of 'pizza_generator_bloc.dart';

/// {@template pizza_generator_state}
/// PizzaGeneratorState description
/// {@endtemplate}
class PizzaGeneratorState extends Equatable {
  /// {@macro pizza_generator_state}
  const PizzaGeneratorState({
    required this.ingredients,
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;
  final List<Ingredient> ingredients;

  @override
  List<Object> get props => [customProperty, ingredients];

  /// Creates a copy of the current PizzaGeneratorState with property changes
  PizzaGeneratorState copyWith({
    String? customProperty,
    List<Ingredient>? ingredients,
  }) {
    return PizzaGeneratorState(
      customProperty: customProperty ?? this.customProperty,
      ingredients: ingredients ?? this.ingredients,
    );
  }
}

/// {@template pizza_generator_initial}
/// The initial state of PizzaGeneratorState
/// {@endtemplate}
class PizzaGeneratorInitial extends PizzaGeneratorState {
  /// {@macro pizza_generator_initial}
  PizzaGeneratorInitial() : super(ingredients: []);
}
