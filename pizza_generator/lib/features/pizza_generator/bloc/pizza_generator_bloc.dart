import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_generator/domain/entities/ingredient.dart';
import 'package:pizza_generator/domain/usecases/generation_usecases.dart';
import 'package:pizza_generator/domain/usecases/ingredients_usecases.dart';

part 'pizza_generator_event.dart';
part 'pizza_generator_state.dart';

class PizzaGeneratorBloc
    extends Bloc<PizzaGeneratorEvent, PizzaGeneratorState> {
  PizzaGeneratorBloc({
    required this.addIngredientUsecase,
    required this.deleteIngredientUsecase,
    required this.generateIngredientsUsecase,
    required this.loadIngredientsUsecase,
    required this.saveIngredientsUsecase,
  }) : super(PizzaGeneratorInitial()) {
    on<DeleteIngredientEvent>(_onDeleteIngredientEvent);
    on<LoadIngredientsEvent>(_onCustomPizzaGeneratorEvent);
    on<GenerateIngredientsEvent>(_onGenerateIngredientsEvent);
    on<IngredientsSelectionChanged>(_onIngredientSelectionChanged);
    on<AddIngredientEvent>(_onAddIngredientEvent);
  }
  final AddIngredientUsecase addIngredientUsecase;
  final DeleteIngredientUsecase deleteIngredientUsecase;
  final GenerateIngredientsUsecase generateIngredientsUsecase;
  final LoadIngredientsUsecase loadIngredientsUsecase;
  final SaveIngredientsUsecase saveIngredientsUsecase;

  FutureOr<void> _onDeleteIngredientEvent(
    DeleteIngredientEvent event,
    Emitter<PizzaGeneratorState> emit,
  ) async {
    final ingredient = event.ingredient;
    final failureOrIngredients =
        await deleteIngredientUsecase(ingredient: ingredient).run();
    failureOrIngredients.fold(
      (l) => (),
      (ingredients) => emit(state.copyWith(ingredients: ingredients)),
    );
  }

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

  FutureOr<void> _onAddIngredientEvent(
    AddIngredientEvent event,
    Emitter<PizzaGeneratorState> emit,
  ) async {
    final name = event.name;
    final failureOrIngredients = await addIngredientUsecase(name: name).run();
    failureOrIngredients.fold(
      (l) => (),
      (r) => emit(state.copyWith(ingredients: r)),
    );
  }

  FutureOr<void> _onGenerateIngredientsEvent(
    GenerateIngredientsEvent event,
    Emitter<PizzaGeneratorState> emit,
  ) async {
    final failureOrIngredients =
        await generateIngredientsUsecase(ingredients: state.ingredients).run();
    failureOrIngredients.fold(
      (l) => (),
      (r) => emit(state.copyWith(generatedIngredients: r)),
    );
  }
}
