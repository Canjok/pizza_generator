import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';

abstract class SettingsRepository {
  SettingsRepository();

  TaskEither<Failure, int> loadIngredientGenerationCount();

  TaskEither<Failure, Unit> saveIngredientGenerationCount(int count);

  TaskEither<Failure, bool> loadAllowMultipleUsageOfAnIngredient();

  TaskEither<Failure, Unit> saveAllowMultipleUsageOfAnIngredient({
    required bool allow,
  });
}
