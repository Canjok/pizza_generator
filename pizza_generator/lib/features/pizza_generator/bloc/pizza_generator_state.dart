part of 'pizza_generator_bloc.dart';

/// {@template pizza_generator_state}
/// PizzaGeneratorState description
/// {@endtemplate}
class PizzaGeneratorState extends Equatable {
  /// {@macro pizza_generator_state}
  const PizzaGeneratorState({
    required this.ingredients,
    required this.generatedIngredients,
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;
  final List<Ingredient> ingredients;
  final List<String> generatedIngredients;

  @override
  List<Object> get props => [customProperty, ingredients, generatedIngredients];

  /// Creates a copy of the current PizzaGeneratorState with property changes
  PizzaGeneratorState copyWith({
    String? customProperty,
    List<Ingredient>? ingredients,
    List<String>? generatedIngredients,
  }) {
    return PizzaGeneratorState(
      customProperty: customProperty ?? this.customProperty,
      ingredients: ingredients ?? this.ingredients,
      generatedIngredients: generatedIngredients ?? this.generatedIngredients,
    );
  }
}

/// {@template pizza_generator_initial}
/// The initial state of PizzaGeneratorState
/// {@endtemplate}
class PizzaGeneratorInitial extends PizzaGeneratorState {
  /// {@macro pizza_generator_initial}
  PizzaGeneratorInitial() : super(ingredients: [], generatedIngredients: []);
}
