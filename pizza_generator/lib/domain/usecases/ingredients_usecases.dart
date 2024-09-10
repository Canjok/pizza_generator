import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/domain/entities/ingredient.dart';
import 'package:pizza_generator/domain/repositories/ingredients_repository.dart';

sealed class IngredientsUsecase {
  IngredientsUsecase({required this.ingredientsRepository});

  final IngredientsRepository ingredientsRepository;
}

class LoadIngredientsUsecase extends IngredientsUsecase {
  LoadIngredientsUsecase({required super.ingredientsRepository});

  TaskEither<Failure, List<Ingredient>> call() {
    return ingredientsRepository.getExampleIngredients();
  }
}
