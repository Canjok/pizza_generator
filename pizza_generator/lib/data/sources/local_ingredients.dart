import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/data/models/ingredient_list_model.dart';
import 'package:pizza_generator/data/sources/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LocalIngredients {
  LocalIngredients({required this.preferences});
  final SharedPreferencesWithCache preferences;

  final _key = PreferenceKeys.ingredients.name;

  TaskEither<Failure, Unit> saveIngredients(IngredientListModel ingredients) {
    return TaskEither.tryCatch(
      () async {
        final ingredientsJsonStringList = ingredients.ingredients
            .map(
              (e) => json.encode(e.toJson()),
            )
            .toList();
        await preferences.setStringList(_key, ingredientsJsonStringList);
        return unit;
      },
      (error, stackTrace) => UnknownFailure(),
    );
  }
}