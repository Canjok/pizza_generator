part of 'settings_bloc.dart';

abstract class SettingsEvent  {
  const SettingsEvent();

}

/// {@template custom_settings_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomSettingsEvent extends SettingsEvent {
  /// {@macro custom_settings_event}
  const CustomSettingsEvent();
}
