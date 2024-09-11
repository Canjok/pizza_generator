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
    required this.saveIngredientsUsecase,
  }) : super(PizzaGeneratorInitial()) {
    on<LoadIngredientsEvent>(_onCustomPizzaGeneratorEvent);
    on<IngredientsSelectionChanged>(_onIngredientSelectionChanged);
  }
  final LoadIngredientsUsecase loadIngredientsUsecase;
  final SaveIngredientsUsecase saveIngredientsUsecase;

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

  FutureOr<void> _onIngredientSelectionChanged(
    IngredientsSelectionChanged event,
    Emitter<PizzaGeneratorState> emit,
  ) async {
    final oldIngredients = state.ingredients;
    final name = event.name;
    final isSelected = event.isSelected;

    final newIngredients = oldIngredients.map(
      (e) {
        if (e.name == name) {
          return e.copyWith(isSelected: isSelected);
        }
        return e;
      },
    ).toList();

    final failureOrUnit = await saveIngredientsUsecase(newIngredients).run();

    failureOrUnit.fold(
      (l) => (),
      (r) => emit(state.copyWith(ingredients: newIngredients)),
    );
  }
}
