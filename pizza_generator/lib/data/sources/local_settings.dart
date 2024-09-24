import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/data/sources/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LocalSettings {
  LocalSettings({required this.preferences});
  final SharedPreferencesWithCache preferences;

  final _key = PreferenceKeys.ingredientGenerationCount.name;

  TaskEither<Failure, int> loadIngredientCountToGenerate() {
    return TaskEither.tryCatch(
      () async {
        final count = preferences.getInt(_key) ?? 1;
        return count;
      },
      (error, stackTrace) => UnknownFailure(),
    );
  }

  TaskEither<Failure, Unit> saveIngredientCountToGenerate(int count) {
    return TaskEither.tryCatch(
      () async {
        await preferences.setInt(_key, count);
        return unit;
      },
      (error, stackTrace) => UnknownFailure(),
    );
  }
}
