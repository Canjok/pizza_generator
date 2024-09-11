import 'package:fpdart/fpdart.dart';
import 'package:pizza_generator/core/failure.dart';
import 'package:pizza_generator/data/sources/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class CommonPreferences {
  CommonPreferences({required this.preferences});

  final SharedPreferencesWithCache preferences;
  final _key = PreferenceKeys.firstTimeAppLaunch.name;

  TaskEither<Failure, Unit> setFirstTimeAppLaunch({required bool isFirstTime}) {
    return TaskEither.tryCatch(
      () async {
        await preferences.setBool(_key, isFirstTime);
        return unit;
      },
      (error, stackTrace) => UnknownFailure(),
    );
  }

  TaskEither<Failure, bool> getFirstTimeAppLaunch() {
    return TaskEither.tryCatch(
      () async {
        final isFirstTime = preferences.getBool(_key) ?? true;
        return isFirstTime;
      },
      (error, stackTrace) => UnknownFailure(),
    );
  }
}
