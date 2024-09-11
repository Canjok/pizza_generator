import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/domain/entities/ingredient.dart';

abstract class IngredientsRepository {
  TaskEither<Failure, List<Ingredient>> getExampleIngredients();
  TaskEither<Failure, Unit> saveIngredients(List<Ingredient> ingredients);
}
