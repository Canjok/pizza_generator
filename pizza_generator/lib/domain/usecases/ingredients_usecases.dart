import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/domain/entities/ingredient.dart';
import 'package:pizza_generator/domain/repositories/common_preferences_repository.dart';
import 'package:pizza_generator/domain/repositories/ingredients_repository.dart';

sealed class IngredientsUsecase {
  IngredientsUsecase({required this.ingredientsRepository});

  final IngredientsRepository ingredientsRepository;
}

class AddIngredientUsecase extends IngredientsUsecase {
  AddIngredientUsecase({required super.ingredientsRepository});

  TaskEither<Failure, List<Ingredient>> call({required String name}) {
    final ingredient = Ingredient(name: name, isSelected: true);
    return ingredientsRepository.addIngredient(ingredient);
  }
}

class LoadIngredientsUsecase extends IngredientsUsecase {
  LoadIngredientsUsecase({
    required this.commonPreferencesRepository,
    required super.ingredientsRepository,
  });

  final CommonPreferencesRepository commonPreferencesRepository;

  TaskEither<Failure, List<Ingredient>> call() {
    return commonPreferencesRepository.getIsFirstAppLaunch().flatMap(
      (isFirstLaunch) {
        return ingredientsRepository.getExampleIngredients();
      },
    );
  }
}

class SaveIngredientsUsecase extends IngredientsUsecase {
  SaveIngredientsUsecase({required super.ingredientsRepository});

  TaskEither<Failure, Unit> call(List<Ingredient> ingredients) {
    return ingredientsRepository.saveIngredients(ingredients);
  }
}
