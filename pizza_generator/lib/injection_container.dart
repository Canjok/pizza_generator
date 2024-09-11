import 'package:get_it/get_it.dart';
import 'package:pizza_generator/data/repository_impls/ingredients_repository_impl.dart';
import 'package:pizza_generator/data/sources/local_ingredients.dart';
import 'package:pizza_generator/data/sources/preference_keys.dart';
import 'package:pizza_generator/domain/repositories/ingredients_repository.dart';
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
    // Repositories
    ..registerLazySingleton<IngredientsRepository>(
      () => IngredientsRepositoryImpl(localIngredients: sl()),
    )

    // Usecases
    ..registerLazySingleton(
      () => LoadIngredientsUsecase(ingredientsRepository: sl()),
    )
    ..registerLazySingleton(
      () => SaveIngredientsUsecase(ingredientsRepository: sl()),
    );
}
