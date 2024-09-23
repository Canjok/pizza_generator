import 'package:get_it/get_it.dart';
import 'package:pizza_generator/data/repository_impls/common_preferences_repository_impl.dart';
import 'package:pizza_generator/data/repository_impls/ingredients_repository_impl.dart';
import 'package:pizza_generator/data/sources/common_preferences.dart';
import 'package:pizza_generator/data/sources/local_ingredients.dart';
import 'package:pizza_generator/data/sources/preference_keys.dart';
import 'package:pizza_generator/domain/repositories/common_preferences_repository.dart';
import 'package:pizza_generator/domain/repositories/ingredients_repository.dart';
import 'package:pizza_generator/domain/usecases/generation_usecases.dart';
import 'package:pizza_generator/domain/usecases/ingredients_usecases.dart';
import 'package:shared_preferences/shared_preferences.dart';

// service locator
final sl = GetIt.I;

Future<void> initServiceLocator() async {
  final preferences = await SharedPreferencesWithCache.create(
    cacheOptions: SharedPreferencesWithCacheOptions(
      allowList: PreferenceKeys.values
          .map(
            (e) => e.name,
          )
          .toSet(),
    ),
  );
  sl
    // Datasources
    ..registerLazySingleton(
      () => LocalIngredients(preferences: preferences),
    )
    ..registerLazySingleton(
      () => CommonPreferences(preferences: preferences),
    )
    // Repositories
    ..registerLazySingleton<CommonPreferencesRepository>(
      () => CommonPreferencesRepositoryImpl(commonPreferences: sl()),
    )
    ..registerLazySingleton<IngredientsRepository>(
      () => IngredientsRepositoryImpl(localIngredients: sl()),
    )
    // Usecases
    ..registerLazySingleton(
      () => AddIngredientUsecase(
        ingredientsRepository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => DeleteIngredientUsecase(
        ingredientsRepository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => LoadIngredientsUsecase(
        commonPreferencesRepository: sl(),
        ingredientsRepository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => SaveIngredientsUsecase(ingredientsRepository: sl()),
    )
    ..registerLazySingleton(() => GenerateIngredientsUsecase());
}
