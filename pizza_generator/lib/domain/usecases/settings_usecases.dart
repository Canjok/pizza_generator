import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/domain/repositories/settings_repository.dart';

sealed class SettingsUsecases {
  SettingsUsecases({required this.settingsRepository});

  final SettingsRepository settingsRepository;
}

class IncreaseIngredientGenerationCount extends SettingsUsecases {
  IncreaseIngredientGenerationCount({required super.settingsRepository});

  TaskEither<Failure, int> call() {
    return settingsRepository
        .loadIngredientGenerationCount()
        .flatMap(
          (r) => settingsRepository.saveIngredientGenerationCount(r + 1),
        )
        .andThen(
          settingsRepository.loadIngredientGenerationCount,
        );
  }
}

class DecreaseIngredientGenerationCount extends SettingsUsecases {
  DecreaseIngredientGenerationCount({required super.settingsRepository});

  TaskEither<Failure, int> call() {
    return settingsRepository.loadIngredientGenerationCount().flatMap(
      (r) {
        final newCount = r == 1 ? 1 : r--;
        return settingsRepository.saveIngredientGenerationCount(newCount);
      },
    ).andThen(
      settingsRepository.loadIngredientGenerationCount,
    );
  }
}
