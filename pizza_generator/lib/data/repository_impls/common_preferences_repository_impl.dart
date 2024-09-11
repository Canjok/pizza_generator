import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/data/sources/common_preferences.dart';
import 'package:pizza_generator/domain/repositories/common_preferences_repository.dart';

class CommonPreferencesRepositoryImpl implements CommonPreferencesRepository {
  CommonPreferencesRepositoryImpl({required this.commonPreferences});

  final CommonPreferences commonPreferences;

  @override
  TaskEither<Failure, Unit> setIsFirstAppLaunch({
    required bool isFirstAppLaunch,
  }) {
    return commonPreferences.setFirstTimeAppLaunch(
      isFirstTime: isFirstAppLaunch,
    );
  }

  @override
  TaskEither<Failure, bool> getIsFirstAppLaunch() {
    // saves a false boolean after first read
    return commonPreferences.getFirstTimeAppLaunch().flatMap(
      (isFirstTime) {
        if (isFirstTime) {
          return commonPreferences
              .setFirstTimeAppLaunch(isFirstTime: false)
              .andThen(() => TaskEither.right(false));
        }
        return TaskEither.right(true);
      },
    );
  }
}
