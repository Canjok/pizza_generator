part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class IncreaseIngredientCountEvent extends SettingsEvent {}

class DecreaseIngredientCountEvent extends SettingsEvent {}

class LoadIngredientCountEvent extends SettingsEvent {}
