import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/domain/entities/ingredient.dart';
import 'package:pizza_generator/domain/repositories/ingredient_generator_repository.dart';

sealed class GenerationUsecases {}

final class GenerateIngredientsUsecase {
  TaskEither<Failure, List<String>> call({
    required List<Ingredient> ingredients,
  }) {
    const ingredientCount = 3;
    return generateIngredients(ingredients, ingredientCount);
  }
}
