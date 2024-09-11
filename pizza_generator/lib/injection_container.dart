import 'package:get_it/get_it.dart';
import 'package:pizza_generator/data/repository_impls/ingredients_repository_impl.dart';
import 'package:pizza_generator/domain/repositories/ingredients_repository.dart';
import 'package:pizza_generator/domain/usecases/ingredients_usecases.dart';

// service locator
final sl = GetIt.I;

Future<void> initServiceLocator() async {
  // Repositories
  sl
    ..registerLazySingleton<IngredientsRepository>(
      IngredientsRepositoryImpl.new,
    )

    // Usecases
    ..registerLazySingleton(
      () => LoadIngredientsUsecase(ingredientsRepository: sl()),
    );
}
