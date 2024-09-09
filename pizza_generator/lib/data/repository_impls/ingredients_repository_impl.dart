import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/data/sources/example_ingredients.dart';
import 'package:pizza_generator/domain/entities/ingredient.dart';
import 'package:pizza_generator/domain/repositories/ingredients_repository.dart';

class IngredientsRepositoryImpl extends IngredientsRepository {
  @override
  TaskEither<Failure, List<Ingredient>> getExampleIngredients() {
    return TaskEither.tryCatch(
      () async => ExampleIngredients.getExampleIngredientModels().toDomain(),
      (error, stackTrace) => UnknownFailure(),
    );
  }
}
