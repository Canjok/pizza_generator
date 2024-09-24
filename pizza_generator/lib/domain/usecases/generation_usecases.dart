import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/domain/entities/ingredient.dart';
import 'package:pizza_generator/domain/repositories/ingredient_generator_repository.dart';
import 'package:pizza_generator/domain/repositories/settings_repository.dart';

sealed class GenerationUsecases {}

final class GenerateIngredientsUsecase {
  GenerateIngredientsUsecase({required this.settingsRepository});

  final SettingsRepository settingsRepository;
  TaskEither<Failure, List<String>> call({
    required List<Ingredient> ingredients,
  }) {
    return TaskEither<Failure, List<String>>.Do(
      ($) async {
        final ingredientCount =
            await $(settingsRepository.loadIngredientGenerationCount());
        final allowRepetitiveIngredients =
            await $(settingsRepository.loadAllowMultipleUsageOfAnIngredient());
        return $(
          generateIngredients(
            ingredients: ingredients,
            count: ingredientCount,
            allowRepetitions: allowRepetitiveIngredients,
          ),
        );
      },
    );
  }
}
