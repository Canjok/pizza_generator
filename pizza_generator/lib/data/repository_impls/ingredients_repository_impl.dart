import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/data/models/ingredient_list_model.dart';
import 'package:pizza_generator/data/models/ingredient_model.dart';
import 'package:pizza_generator/data/sources/example_ingredients.dart';
import 'package:pizza_generator/data/sources/local_ingredients.dart';
import 'package:pizza_generator/domain/entities/ingredient.dart';
import 'package:pizza_generator/domain/repositories/ingredients_repository.dart';

class IngredientsRepositoryImpl extends IngredientsRepository {
  IngredientsRepositoryImpl({required this.localIngredients});

  final LocalIngredients localIngredients;
  @override
  TaskEither<Failure, List<Ingredient>> getExampleIngredients() {
    return TaskEither.tryCatch(
      () async => ExampleIngredients.getExampleIngredientModels().toDomain(),
      (error, stackTrace) => UnknownFailure(),
    );
  }

  @override
  TaskEither<Failure, Unit> saveIngredients(List<Ingredient> ingredients) {
    return localIngredients
        .saveIngredients(IngredientListModel.fromDomain(ingredients));
  }

  @override
  TaskEither<Failure, List<Ingredient>> addIngredient(Ingredient ingredient) {
    return localIngredients
        .addIngredient(IngredientModel.fromDomain(ingredient))
        .map(
          (r) => r.toDomain(),
        );
  }
}
