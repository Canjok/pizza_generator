import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';

abstract class CommonPreferencesRepository {
  CommonPreferencesRepository();

  TaskEither<Failure, Unit> setIsFirstAppLaunch({
    required bool isFirstAppLaunch,
  });

  TaskEither<Failure, bool> getIsFirstAppLaunch();
}
