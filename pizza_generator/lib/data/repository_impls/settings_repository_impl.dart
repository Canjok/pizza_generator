import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/data/sources/local_settings.dart';
import 'package:pizza_generator/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required this.localSettings});

  final LocalSettings localSettings;

  @override
  TaskEither<Failure, int> loadIngredientGenerationCount() {
    return localSettings.loadIngredientCountToGenerate();
  }

  @override
  TaskEither<Failure, Unit> saveIngredientGenerationCount(int count) {
    return localSettings.saveIngredientCountToGenerate(count);
  }
}
