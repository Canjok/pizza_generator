part of 'settings_bloc.dart';

/// {@template settings_state}
/// SettingsState description
/// {@endtemplate}
class SettingsState {
  /// {@macro settings_state}
  const SettingsState({
    required this.allowMultipleUsageOfAnIngredient,
    required this.ingredientCountToGenerate,
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;
  final int ingredientCountToGenerate;
  final bool allowMultipleUsageOfAnIngredient;

  /// Creates a copy of the current SettingsState with property changes
  SettingsState copyWith({
    bool? allowMultipleUsageOfAnIngredient,
    String? customProperty,
    int? ingredientCountToGenerate,
  }) {
    return SettingsState(
      allowMultipleUsageOfAnIngredient: allowMultipleUsageOfAnIngredient ??
          this.allowMultipleUsageOfAnIngredient,
      customProperty: customProperty ?? this.customProperty,
      ingredientCountToGenerate:
          ingredientCountToGenerate ?? this.ingredientCountToGenerate,
    );
  }
}

/// {@template settings_initial}
/// The initial state of SettingsState
/// {@endtemplate}
class SettingsInitial extends SettingsState {
  /// {@macro settings_initial}
  const SettingsInitial()
      : super(
          ingredientCountToGenerate: 1,
          allowMultipleUsageOfAnIngredient: true,
        );
}
