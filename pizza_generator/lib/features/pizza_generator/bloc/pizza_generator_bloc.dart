import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'pizza_generator_event.dart';
part 'pizza_generator_state.dart';

class PizzaGeneratorBloc extends Bloc<PizzaGeneratorEvent, PizzaGeneratorState> {
  PizzaGeneratorBloc() : super(const PizzaGeneratorInitial()) {
    on<CustomPizzaGeneratorEvent>(_onCustomPizzaGeneratorEvent);
  }

  FutureOr<void> _onCustomPizzaGeneratorEvent(
    CustomPizzaGeneratorEvent event,
    Emitter<PizzaGeneratorState> emit,
  ) {
    // TODO: Add Logic
  }
}
