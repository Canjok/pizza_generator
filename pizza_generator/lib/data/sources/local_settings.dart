import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/data/sources/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LocalSettings {
  LocalSettings({required this.preferences});
  final SharedPreferencesWithCache preferences;

  final _generationCountKey = PreferenceKeys.ingredientGenerationCount.name;
  final _allowMultipleUsageKey =
      PreferenceKeys.allowMultipleUsageOfAnIngredient.name;

  TaskEither<Failure, int> loadIngredientCountToGenerate() {
    return TaskEither.tryCatch(
      () async {
        final count = preferences.getInt(_generationCountKey) ?? 1;
        return count;
      },
      (error, stackTrace) => UnknownFailure(),
    );
  }

  TaskEither<Failure, Unit> saveIngredientCountToGenerate(int count) {
    return TaskEither.tryCatch(
      () async {
        await preferences.setInt(_generationCountKey, count);
        return unit;
      },
      (error, stackTrace) => UnknownFailure(),
    );
  }

  TaskEither<Failure, bool> loadAllowMultipleUsageOfAnIngredient() {
    return TaskEither.tryCatch(
      () async {
        final allow = preferences.getBool(_allowMultipleUsageKey) ?? true;
        return allow;
      },
      (error, stackTrace) => UnknownFailure(),
    );
  }

  TaskEither<Failure, Unit> saveAllowMultipleUsageOfAnIngredient({
    required bool allowMultiple,
  }) {
    return TaskEither.tryCatch(
      () async {
        await preferences.setBool(_allowMultipleUsageKey, allowMultiple);
        return unit;
      },
      (error, stackTrace) => UnknownFailure(),
    );
  }
}
