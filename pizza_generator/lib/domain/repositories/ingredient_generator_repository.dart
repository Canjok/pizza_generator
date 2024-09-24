import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/algorithms/string_generator.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/domain/entities/ingredient.dart';

TaskEither<Failure, List<String>> generateIngredients({
  required List<Ingredient> ingredients,
  required int count,
  required bool allowRepetitions,
}) {
  return TaskEither.tryCatch(
    () async {
      final ingredientNames = ingredients
          .where(
            (element) => element.isSelected,
          )
          .map(
            (e) => e.name,
          )
          .toList();
      return StringGenerator.generateStringsFromStringList(
        strings: ingredientNames,
        count: count,
        allowRepetitions: allowRepetitions,
      );
    },
    (error, stackTrace) => UnknownFailure(),
  );
}
