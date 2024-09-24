part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class IncreaseIngredientCountEvent extends SettingsEvent {}

class DecreaseIngredientCountEvent extends SettingsEvent {}

class LoadIngredientCountEvent extends SettingsEvent {}

class SetAllowMultipleUsageOfAnIngredientEvent extends SettingsEvent {
  SetAllowMultipleUsageOfAnIngredientEvent({required this.allow});

  final bool allow;
}

class LoadAllowMultipleUsageOfAnIngredientEvent extends SettingsEvent {}
