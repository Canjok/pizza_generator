import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/domain/repositories/settings_repository.dart';

sealed class SettingsUsecases {
  SettingsUsecases({required this.settingsRepository});

  final SettingsRepository settingsRepository;
}

class LoadIngredientGenerationCountUsecase extends SettingsUsecases {
  LoadIngredientGenerationCountUsecase({required super.settingsRepository});

  TaskEither<Failure, int> call() {
    return settingsRepository.loadIngredientGenerationCount();
  }
}

class SaveIngredientGenerationCountUsecase extends SettingsUsecases {
  SaveIngredientGenerationCountUsecase({required super.settingsRepository});

  TaskEither<Failure, Unit> call({required int count}) {
    return settingsRepository.saveIngredientGenerationCount(count);
  }
}
