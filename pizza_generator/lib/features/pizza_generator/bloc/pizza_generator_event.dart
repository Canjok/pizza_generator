part of 'pizza_generator_bloc.dart';

abstract class PizzaGeneratorEvent  extends Equatable {
  const PizzaGeneratorEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_pizza_generator_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomPizzaGeneratorEvent extends PizzaGeneratorEvent {
  /// {@macro custom_pizza_generator_event}
  const CustomPizzaGeneratorEvent();
}
