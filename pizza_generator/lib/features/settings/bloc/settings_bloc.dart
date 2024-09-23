import 'dart:async';

import 'package:bloc/bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsInitial()) {
    on<IncreaseIngredientCountEvent>(_onIncreaseIngredientCountEvent);
    on<DecreaseIngredientCountEvent>(_onDecreaseIngredientCountEvent);
  }

  FutureOr<void> _onIncreaseIngredientCountEvent(
    IncreaseIngredientCountEvent event,
    Emitter<SettingsState> emit,
  ) {
    final newCount = state.ingredientCountToGenerate + 1;
    emit(state.copyWith(ingredientCountToGenerate: newCount));
  }

  FutureOr<void> _onDecreaseIngredientCountEvent(
    DecreaseIngredientCountEvent event,
    Emitter<SettingsState> emit,
  ) {
    final newCount = state.ingredientCountToGenerate == 1
        ? 1
        : state.ingredientCountToGenerate - 1;
    emit(state.copyWith(ingredientCountToGenerate: newCount));
  }
}
