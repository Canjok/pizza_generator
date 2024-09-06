part of 'pizza_generator_bloc.dart';

/// {@template pizza_generator_state}
/// PizzaGeneratorState description
/// {@endtemplate}
class PizzaGeneratorState extends Equatable {
  /// {@macro pizza_generator_state}
  const PizzaGeneratorState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current PizzaGeneratorState with property changes
  PizzaGeneratorState copyWith({
    String? customProperty,
  }) {
    return PizzaGeneratorState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template pizza_generator_initial}
/// The initial state of PizzaGeneratorState
/// {@endtemplate}
class PizzaGeneratorInitial extends PizzaGeneratorState {
  /// {@macro pizza_generator_initial}
  const PizzaGeneratorInitial() : super();
}
