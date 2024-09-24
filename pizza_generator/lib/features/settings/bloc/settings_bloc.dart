import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pizza_generator/domain/usecases/settings_usecases.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.loadAllowMultipleUsageOfAnIngredientUsecase,
    required this.loadIngredientGenerationCountUsecase,
    required this.saveAllowMultipleUsageOfAnIngredientUsecase,
    required this.saveIngredientGenerationCountUsecase,
  }) : super(const SettingsInitial()) {
    on<IncreaseIngredientCountEvent>(_onIncreaseIngredientCountEvent);
    on<DecreaseIngredientCountEvent>(_onDecreaseIngredientCountEvent);
    on<LoadIngredientCountEvent>(_onLoadIngredientCountEvent);
    on<SetAllowMultipleUsageOfAnIngredientEvent>(
      _setAllowMultipleUsageOfAnIngredientEvent,
    );
    on<LoadAllowMultipleUsageOfAnIngredientEvent>(
      _onLoadAllowMultipleUsageOfAnIngredientEvent,
    );
  }

  LoadAllowMultipleUsageOfAnIngredientUsecase
      loadAllowMultipleUsageOfAnIngredientUsecase;
  LoadIngredientGenerationCountUsecase loadIngredientGenerationCountUsecase;
  SaveAllowMultipleUsageOfAnIngredientUsecase
      saveAllowMultipleUsageOfAnIngredientUsecase;
  SaveIngredientGenerationCountUsecase saveIngredientGenerationCountUsecase;

  FutureOr<void> _onIncreaseIngredientCountEvent(
    IncreaseIngredientCountEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final previousCount = state.ingredientCountToGenerate;
    final newCount = previousCount + 1;
    final failureOrInt =
        await saveIngredientGenerationCountUsecase(count: newCount).run();
    failureOrInt.fold(
      (l) => (),
      (_) => emit(
        state.copyWith(ingredientCountToGenerate: newCount),
      ),
    );
  }

  FutureOr<void> _onDecreaseIngredientCountEvent(
    DecreaseIngredientCountEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final previousCount = state.ingredientCountToGenerate;
    final newCount = previousCount == 1 ? 1 : previousCount - 1;
    final failureOrUnit =
        await saveIngredientGenerationCountUsecase(count: newCount).run();
    failureOrUnit.fold(
      (l) => (),
      (_) => emit(
        state.copyWith(ingredientCountToGenerate: newCount),
      ),
    );
  }

  FutureOr<void> _onLoadIngredientCountEvent(
    LoadIngredientCountEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final failureOrCount = await loadIngredientGenerationCountUsecase().run();
    failureOrCount.fold(
      (l) => (),
      (count) => emit(
        state.copyWith(ingredientCountToGenerate: count),
      ),
    );
  }

  FutureOr<void> _setAllowMultipleUsageOfAnIngredientEvent(
    SetAllowMultipleUsageOfAnIngredientEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final failureOrUnit = await saveAllowMultipleUsageOfAnIngredientUsecase(
      allow: event.allow,
    ).run();
    failureOrUnit.fold(
      (l) => (),
      (_) => emit(
        state.copyWith(allowMultipleUsageOfAnIngredient: event.allow),
      ),
    );
  }

  FutureOr<void> _onLoadAllowMultipleUsageOfAnIngredientEvent(
    LoadAllowMultipleUsageOfAnIngredientEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final failureOrBool =
        await loadAllowMultipleUsageOfAnIngredientUsecase().run();
    failureOrBool.fold(
      (l) => (),
      (isAllowed) => emit(
        state.copyWith(allowMultipleUsageOfAnIngredient: isAllowed),
      ),
    );
  }
}
