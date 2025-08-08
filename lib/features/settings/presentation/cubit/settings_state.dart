part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required AsyncValue<bool> machineMaintenance,
    required AsyncValue<bool> electricityLimit,
    required AsyncValue<bool> hotTemperature,
  }) = _SettingsState;
}
