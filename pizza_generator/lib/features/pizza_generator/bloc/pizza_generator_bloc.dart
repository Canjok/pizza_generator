import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_generator/domain/entities/ingredient.dart';
import 'package:pizza_generator/domain/usecases/ingredients_usecases.dart';

part 'pizza_generator_event.dart';
part 'pizza_generator_state.dart';

class PizzaGeneratorBloc
    extends Bloc<PizzaGeneratorEvent, PizzaGeneratorState> {
  PizzaGeneratorBloc({
    required this.loadIngredientsUsecase,
  }) : super(PizzaGeneratorInitial()) {
    on<LoadIngredientsEvent>(_onCustomPizzaGeneratorEvent);
  }
  final LoadIngredientsUsecase loadIngredientsUsecase;

  FutureOr<void> _onCustomPizzaGeneratorEvent(
    LoadIngredientsEvent event,
    Emitter<PizzaGeneratorState> emit,
  ) async {
    final failureOrIngredients = await loadIngredientsUsecase().run();
    failureOrIngredients.fold(
      (_) => (),
      (r) => emit(
        state.copyWith(ingredients: r),
      ),
    );
  }
}
